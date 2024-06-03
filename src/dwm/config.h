/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int focusonwheel       = 0;
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating    issticky    monitor */
	{ "Dragon-drop",  NULL,       NULL,       0,       1,     1,      -1 },
	{ "TermPop",  NULL,       NULL,       0,       1,     1,      -1 },
	{ "code-oss",     NULL,       NULL,       1 << 1,            0,     0,      -1 },
	{ "Google-chrome",     NULL,       NULL,       1 << 3,      0,      0,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 3,       0,     0,      -1 },
	{ "Todoist",     NULL,       NULL,       1 << 4,      0,      0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *browsercmd[]  = { "google-chrome-stable", NULL };
static const char *langcmd[]  = { "xkb-switch", "-n", NULL };
static const char *zoomercmd[]  = { "boomer", NULL };
static const char *screenshotcmd[]  = { "scrotter", NULL };
static const char *colorpickercmd[]  = { "xcolor", "-s", "clipboard", NULL };
static const char *fdcbcmd[]  = { "termpop", "180x40", "fd_clipboard", "/", NULL };
static const char *emojicmd[]  = { "termpop", "180x40", "emoji_fuzz", NULL };
static const char *sysactioncmd[]  = { "sysaction", NULL };
static const char *clipmenucmd[]  = { "clipmenu", "-i", NULL };
static const char *bluecmd[]  = { "blue_dis_connect", NULL };
static const char *colorcmd[]  = { "clrr", NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_e,      spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_v,      spawn,          {.v = browsercmd } },
	{ MODKEY,                       XK_Escape, spawn,          {.v = langcmd } },
	{ MODKEY,                       XK_e,      spawn,          {.v = zoomercmd } },
	{ MODKEY|ShiftMask,             XK_s,      spawn,          {.v = screenshotcmd } },
	{ MODKEY,                       XK_m,      spawn,          {.v = emojicmd } },
	{ MODKEY,                       XK_o,      spawn,          {.v = colorpickercmd } },
	{ MODKEY,                       XK_l,      spawn,          {.v = bluecmd } },
	{ MODKEY,                       XK_Delete, spawn,          {.v = sysactioncmd } },
	{ MODKEY,                       XK_v,      spawn,          {.v = fdcbcmd } },
	{ MODKEY,                       XK_c,      spawn,          {.v = clipmenucmd } },
	{ MODKEY,                       XK_s,      spawn,          {.v = colorcmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          SHCMD("playerctl play-pause && notify-send -t 4000 -r 25001 \"`playerctl metadata --format '({{duration(position)}}) {{artist}}'`\" \"`playerctl metadata --format '{{title}}'`\"") },
	{ MODKEY|ShiftMask|ControlMask, XK_Right,  spawn,          SHCMD("playerctl next && sleep 0.3 && notify-send -t 4000 -r 25001 \"`playerctl metadata --format 'Now Playing: {{artist}}'`\" \"`playerctl metadata --format '{{title}}'`\"") },
	{ MODKEY|ShiftMask|ControlMask, XK_Left,   spawn,          SHCMD("playerctl previous && sleep 0.3 && notify-send -t 4000 -r 25001 \"`playerctl metadata --format 'Now Playing: {{artist}}'`\" \"`playerctl metadata --format '{{title}}'`\"") },
	{ MODKEY|ShiftMask,             XK_Right,  spawn,          SHCMD("playerctl position 5+ && notify-send -t 4000 -r 25001 \"`playerctl metadata --format '(5->) {{artist}}'`\" \"`playerctl metadata --format '{{title}}'`\"") },
	{ MODKEY|ShiftMask,             XK_Left,   spawn,          SHCMD("playerctl position 5- && notify-send -t 4000 -r 25001 \"`playerctl metadata --format '(<-5) {{artist}}'`\" \"`playerctl metadata --format '{{title}}'`\"") },
	{ MODKEY|ShiftMask,             XK_Up,     spawn,          SHCMD("pamixer --increase 5 --allow-boost && notify-send -t 4000 -r 25002 \"Volume Increased $(pamixer --get-volume-human)\" -h int:value:\"$(pamixer --get-volume)\"") },
	{ MODKEY|ShiftMask,             XK_Down,   spawn,          SHCMD("pamixer --decrease 5 --allow-boost && notify-send -t 4000 -r 25002 \"Volume Decreased $(pamixer --get-volume-human)\" -h int:value:\"$(pamixer --get-volume)\"") },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_d,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_a,      focusstack,     {.i = -1 } },
	// { MODKEY,                       XK_Up,     incnmaster,     {.i = +1 } },
	// { MODKEY,                       XK_Down,   incnmaster,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_w,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_w,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Tab,    zoom,           {0} },
	{ MODKEY,                       XK_r,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_j,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_grave,  focusmon,       {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY|ShiftMask|ControlMask, XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
};

