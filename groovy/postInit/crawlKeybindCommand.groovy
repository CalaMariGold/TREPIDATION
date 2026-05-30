import net.minecraftforge.fml.common.FMLCommonHandler
import net.minecraftforge.fml.common.gameevent.InputEvent
import net.minecraft.client.Minecraft
import net.minecraft.client.settings.KeyBinding
import net.minecraft.util.ResourceLocation

def COMMANDS = [
    'advancement grant @p only triumph:advancements/dimensions/start',
    'effect @p resistance 15 255',
    'tellraw @p [{"text":"Disoriented, you awaken to find a ","color":"red","italic":true},{"text":"journal","color":"yellow","italic":true},{"text":" attached to your belt. As you begin to write, you notice a scar on your left wrist.","color":"red","italic":true}]',
    'playsound enderskills:page_turn player @p ~ ~ ~ 10',
    'advancement grant @p only triumph:advancements/dimensions/nether',
    'advancement grant @p only triumph:advancements/hidden/unlock_journal',
    'timer @p set 72000'

]
def KEY_DESCRIPTION = 'key.aquaacrobatics.toggle_crawling'

if (FMLCommonHandler.instance().getSide().isServer()) return

def mc = Minecraft.getMinecraft()

KeyBinding crawlKey = null
boolean lookedUp = false
boolean wasDown = false

eventManager.listen { InputEvent.KeyInputEvent event ->
    if (!lookedUp) {
        for (KeyBinding kb : mc.gameSettings.keyBindings) {
            if (kb.getKeyDescription() == KEY_DESCRIPTION) {
                crawlKey = kb
                break
            }
        }
        lookedUp = true
        if (crawlKey == null) {
            log.warn("crawlKeybindCommand: keybind '{}' not found", KEY_DESCRIPTION)
        }
    }
    if (crawlKey == null) return

    boolean isDown = crawlKey.isKeyDown()
    if (isDown && !wasDown && mc.player != null) {  // rising edge: just pressed
        def server = mc.getIntegratedServer()
        def player = server?.getPlayerList()?.getPlayerByUUID(mc.player.getUniqueID())
        if (server != null && player != null) {
            def guardAdv = server.getAdvancementManager().getAdvancement(new ResourceLocation('triumph', 'advancements/dimensions/start'))
            if (guardAdv != null && player.getAdvancements().getProgress(guardAdv).isDone()) return

            for (cmd in COMMANDS) {
                server.getCommandManager().executeCommand(player, cmd)
            }
        }
    }
    wasDown = isDown
}
