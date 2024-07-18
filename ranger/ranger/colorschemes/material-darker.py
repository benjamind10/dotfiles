# material-darker theme for ranger

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *


class MaterialDarker(ColorScheme):
    progress_bar_color = 31

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
                bg = 1
            if context.border:
                fg = 8
            if context.media:
                if context.image:
                    fg = 2
                else:
                    fg = 4
            if context.container:
                fg = 1
            if context.directory:
                attr |= bold
                fg = 4
            elif context.executable and not context.directory:
                attr |= bold
                fg = 3
            if context.socket:
                fg = 5
            if context.fifo or context.device:
                fg = 5
                if context.device:
                    attr |= bold
            if context.link:
                fg = context.good and 6 or 7
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (2, 3):
                    fg = 8
                else:
                    fg = 1
            if not context.selected and (context.cut or context.copied):
                fg = 8
                attr |= bold
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = 2
            if context.badinfo:
                if attr & reverse:
                    bg = 1
                else:
                    fg = 1

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = context.bad and 1 or 2
            elif context.directory:
                fg = 4
            elif context.tab:
                if context.good:
                    bg = 1

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = 2
                elif context.bad:
                    fg = 1
            if context.marked:
                attr |= bold | reverse
                fg = 2
            if context.frozen:
                attr |= bold | reverse
                fg = 6
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = 1

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = 4

            if context.selected:
                attr |= reverse

        return fg, bg, attr
