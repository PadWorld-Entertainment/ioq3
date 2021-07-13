// =================
// MENU
// =================

menushader
{
	nomipmaps
	{
		map menu/main/BgShader2.tga

		tcMod rotate 7
                	tcMod turb .1 .1 .1 .1
		alphaGen Vertex
	}


}



// =================
// CONSOLE
// =================

console
{
	nopicmip
	nomipmaps
    {
        map gfx/misc/padconsoleback.jpg
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        alphaGen vertex
        tcMod rotate 8	//scroll 0.01 0.02
	tcMod turb .1 .2 .1 .1
	//tcMod stretch sin .75 1 .75 .1
	//tcMod scroll 0.01 0.02
	//tcMod scale 2 1
    }
    {
        map gfx/misc/padconsoletitle.tga
        blendFunc GL_ONE GL_ONE
        tcMod rotate -5
    }
}


// =================
// simpleMenuBg
// =================

simpleMenuBg
{
	{
		map "menu/backeffect.tga"
		tcMod rotate 7
                	tcMod turb .1 .1 .1 .1
	}
}
