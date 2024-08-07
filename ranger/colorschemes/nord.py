# nord.py for Ranger

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class nord(ColorScheme):
    progress_bar_color = 4

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
                fg = 15
                bg = 1
            if context.border:
                fg = 8
            if context.image:
                fg = 7
            if context.video:
                fg = 4
            if context.audio:
                fg = 6
            if context.document:
                fg = 2
            if context.container:
                fg = 1
            if context.directory:
                attr |= bold
                fg = 4
            elif context.executable and not \
                    context.directory:
                attr |= bold
                fg = 3
            if context.socket or context.fifo:
                fg = 3
                attr |= bold
            if context.device:
                fg = 3
                attr |= bold
            if context.link:
                fg = context.good and 4 or 5
                attr |= bold
                if context.bad:
                    bg = 1
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (3, 4):
                    fg = 1
                else:
                    fg = 15
            if not context.selected and (context.cut or context.copied):
                fg = 8
                attr |= bold
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = 5
            if context.badinfo:
                if attr & reverse:
                    bg = 5
                else:
                    fg = 5
            if context.inactive_pane:
                fg = 8
                bg = 0

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = context.bad and 1 or 4
            elif context.directory:
                fg = 4
            elif context.tab:
                if context.good:
                    bg = 3
            elif context.link:
                fg = 4

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = 2
                elif context.bad:
                    fg = 5
            if context.marked:
                attr |= bold | reverse
                fg = 5
            if context.frozen:
                attr |= bold | reverse
                fg = 6
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = 5

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = 4

            if context.selected:
                attr |= bold

        return fg, bg, attr

