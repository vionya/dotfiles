from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class LightMode(ColorScheme):
    progress_bar_color = 1

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                fg = 0
                bg = 1
            if context.border:
                fg = 8
            if context.image:
                fg = 146
            if context.video:
                fg = 176
            if context.audio:
                fg = 173
            if context.document:
                fg = 0
            if context.container:
                attr |= bold
                fg = 1
            if context.directory:
                attr |= bold
                # Color 16 is set to 0xA29BFE
                fg = 16
            elif context.executable and not \
                any((context.media, context.container,
                     context.fifo, context.socket)):
                attr |= bold
                fg = 4
            if context.socket:
                fg = 3
                attr |= bold
            if context.fifo or context.device:
                fg = 10
                if context.device:
                    attr |= bold
            if context.link:
                fg = context.good and magenta or 1
            if context.bad:
                fg = 1
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (0, 8):
                    fg = 1
                else:
                    fg = 1
            if not context.selected and (context.cut or context.copied):
                fg = 15
                bg = 8
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = 8
            if context.badinfo:
                if attr & reverse:
                    bg = 1
                else:
                    fg = 0

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = context.bad and 8 or 0
            elif context.directory:
                fg = 16
            elif context.tab:
                if context.good:
                    fg = 1
            elif context.link:
                fg = 8

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = 0
                elif context.bad:
                    fg = 8
            if context.marked:
                attr |= bold | reverse
                fg = 8
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = 10
            if context.loaded:
                bg = self.progress_bar_color

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = 8

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        return fg, bg, attr
