# Rime Ice · fcitx5 主题

**Material 3 风格的 fcitx5 深色主题，冰蓝强调色。**
配色取自 DankMaterialShell 的动态 Material 3 调色板，同样是深色 + `#93CCFF` 冰蓝，和桌面顶栏、窗口是一套视觉语言。

![桌面效果](screenshots/desktop.png)

![候选框效果](screenshots/preview.png)

> 预览图为按主题真实色值、圆角、字号和间距渲染的效果图，实际渲染会有极小的字体度量差异。

## ✨ 特性

- **Material 3 深色调色板**：`#14121C` 面板、`#93CCFF` 冰蓝强调色、`#E6E0EF` 文字
- **9-slice SVG 资源**：圆角与描边在任何分辨率、任意缩放比例下都保持清晰，无位图拉伸
- **纵向候选列表**：选中项整行圆角高亮，冰蓝渐变 + 深色文字，对比清晰
- **分级配色**：预编辑拼音、候选文字、注释、序号各自独立配色
- **完整覆盖**：候选框、右键菜单、工具提示、翻页按钮、子菜单箭头、复选框
- **纯配置 + SVG**：不含二进制资源，整个主题不到 30 KB，易于修改和二次创作
- 字体默认使用 **Noto Sans CJK SC 11**，可自行替换

> 主题作用于 **fcitx5 经典界面（Classic UI）**。如果你在 Linux 上通过 fcitx5 使用 Rime，那么 Rime 的 `weasel.yaml` / `squirrel.yaml` 皮肤不会生效，需要修改的正是本主题。

## 📦 安装

依赖：`fcitx5 >= 5.1`（推荐 `Noto Sans CJK SC` 字体）

```bash
git clone https://github.com/SimonQvQ/fcitx5-rime-ice.git
cd fcitx5-rime-ice
./install.sh
```

安装脚本会：

1. 把主题复制到 `~/.local/share/fcitx5/themes/rimeice/`
2. 备份并更新 `~/.config/fcitx5/conf/classicui.conf`（自动添加/替换 `Theme`、`DarkTheme`、字体、纵排等配置）

然后重启 fcitx5 使其生效：

```bash
fcitx5 -r -d      # 或注销重新登录
```

### 手动安装

```bash
mkdir -p ~/.local/share/fcitx5/themes
cp -r rimeice ~/.local/share/fcitx5/themes/
```

编辑 `~/.config/fcitx5/conf/classicui.conf`：

```ini
Vertical Candidate List=True
Font="Noto Sans CJK SC 11"
MenuFont="Noto Sans CJK SC 11"
Theme=rimeice
DarkTheme=rimeice
UseDarkTheme=True
UseAccentColor=False
```

保存后执行 `fcitx5-remote -r` 或重启 fcitx5。

## 🎨 配色

| 元素 | 颜色 / 参数 |
| --- | --- |
| 面板背景 | 竖向渐变 `#201D2C → #14121C`，圆角 14px |
| 面板描边 | `#93CCFF`，38% 不透明度，1px |
| 选中项背景 | 竖向渐变 `#B7E0FF → #86C7FF`，圆角 9px |
| 选中项文字 | `#003351` |
| 预编辑拼音 | `#93CCFF` |
| 候选文字 | `#E6E0EF` |
| 注释文字 | `#A49BB8` |
| 序号 | 普通 `#93CCFF` / 选中 `#003351` |
| 菜单分隔线 | `#494458` |

## ⚙️ 自定义

### 换强调色

编辑 `rimeice/panel.svg` 中的 `stroke`，以及 `rimeice/highlight.svg` 中两个渐变的 `stop-color`，然后重新复制到主题目录或重新运行 `install.sh`，最后 `fcitx5-remote -r`。

### 改回横向候选

```ini
Vertical Candidate List=False
```

### 调整字号

```ini
Font="Noto Sans CJK SC 12"
MenuFont="Noto Sans CJK SC 12"
```

### 圆角 / 间距

`rimeice/theme.conf` 中：

- `[InputPanel/Background/Margin]`：面板 9-slice 边距（不宜小于圆角）
- `[InputPanel/Highlight/Margin]`：选中项高亮的内边距
- `[InputPanel/ContentMargin]` / `[InputPanel/TextMargin]`：内容与文字边距

修改 `panel.svg` / `highlight.svg` 的 `rx` 可改变圆角。注意圆角必须小于对应的 margin，否则会被拉伸。

### 毛玻璃

`theme.conf` 里预留了 `EnableBlur`，但 fcitx5 的模糊仅在 KDE/KWin 下有效；niri、Hyprland 等合成器需要由合成器提供模糊。

## 🗑 卸载

```bash
./uninstall.sh
```

或手动：

```bash
rm -rf ~/.local/share/fcitx5/themes/rimeice
# 把 classicui.conf 里的 Theme/DarkTheme 改回 default-dark
```

## 🧪 测试环境

- fcitx5 5.1.23（Arch Linux / CachyOS）
- Wayland（niri）
- Noto Sans CJK SC 11
- 配合 Rime（雾凇拼音）使用

## 📄 License

[MIT](LICENSE)

---

## English

**Rime Ice** is a Material 3 dark theme for fcitx5 with an ice-blue (`#93CCFF`) accent, matched to the DankMaterialShell dynamic palette.

- 9-slice SVG assets — crisp at any resolution/scale
- Vertical candidate list with full-width rounded highlight
- Themed candidates, comments, labels, menu, tooltip and pager
- Pure config + SVG (~20 KB), no binary assets
- Default font: Noto Sans CJK SC 11 (configurable)

### Install

```bash
git clone https://github.com/SimonQvQ/fcitx5-rime-ice.git
cd fcitx5-rime-ice
./install.sh
fcitx5 -r -d   # or restart your session
```

The script copies the theme to `~/.local/share/fcitx5/themes/rimeice/` and updates `~/.config/fcitx5/conf/classicui.conf` (with a backup).

> Applies to the fcitx5 **Classic UI**. Rime's `weasel.yaml` / `squirrel.yaml` skins do not affect fcitx5 on Linux.
