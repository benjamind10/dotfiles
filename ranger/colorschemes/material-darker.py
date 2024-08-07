# ~/.config/ranger/colorschemes/material-darker.py

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *


class MaterialDarker(ColorScheme):
    progress_bar_color = 240

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
                fg = 245
            if context.image:
                fg = 136
            if context.video:
                fg = 165
            if context.audio:
                fg = 166
            if context.document:
                fg = 187
            if context.container:
                attr |= bold
                fg = 129
            if context.directory:
                attr |= bold
                fg = 33
            elif context.executable and not any(
                (context.media, context.container, context.fifo, context.socket)
            ):
                attr |= bold
                fg = 64
            if context.socket:
                fg = 168
                attr |= bold
            if context.fifo or context.device:
                fg = 215
                if context.device:
                    attr |= bold
            if context.link:
                fg = context.good and 37 or 124
            if context.bad:
                bg = 124
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (124, 245):
                    fg = 166
                else:
                    fg = 245
            if not context.selected and (context.cut or context.copied):
                fg = 242
                attr |= bold
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = 130
            if context.badinfo:
                if attr & reverse:
                    bg = 124
                else:
                    fg = 124

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = context.bad and 124 or 33
            elif context.directory:
                fg = 33
            elif context.tab:
                if context.good:
                    bg = 37
            elif context.link:
                fg = 33

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = 37
                elif context.bad:
                    fg = 124
            if context.marked:
                attr |= bold | reverse
                fg = 166
            if context.frozen:
                attr |= bold | reverse
                fg = 21
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = 124

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = 33

            if context.selected:
                attr |= bold
                fg = 33

        return fg, bg, attr
