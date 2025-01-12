using Godot;
using System;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.InteropServices;

public class TestScene : Node
{

	public const int GWL_EXSTYLE = -20;
	public const int WS_EX_LAYERED = 0x80000;
	public const int LWA_ALPHA = 0x2;
	public const int LWA_COLORKEY = 0x1;
	
	public const uint WS_EX_TRANSPARENT = 0x00000020;

	[DllImport("user32.dll")]
	static extern bool SetLayeredWindowAttributes(IntPtr hwnd, uint crKey, byte bAlpha, uint dwFlags);

	[DllImport("user32.dll", SetLastError = true)]
	static extern IntPtr FindWindow(string lpClassName, string lpWindowName);

	[DllImport("user32.dll", SetLastError = true)]
	static extern int GetWindowLong(IntPtr hWnd, int nIndex);

	[DllImport("user32.dll")]
	static extern int SetWindowLong(IntPtr hWnd, int nIndex, uint dwNewLong);
	
	[DllImport("user32.dll")]
	static extern IntPtr GetActiveWindow();
	
	
	[DllImport("user32.dll")]
	static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X, int Y, int cx, int cy, uint uFlags);
	
	private struct MARGINS{
		public int cxLeftWidth;
		public int cxRightWidth;
		public int cyTopHeight;
		public int cyBottomHeight;
	}
	
	[DllImport("Dwmapi.dll")]
	static extern uint DwmExtendFrameIntoClientArea(IntPtr hWnd,ref MARGINS margins);
	// Declare member variables here. Examples:
	// private int a = 2;
	// private string b = "text";
	
	
	static readonly IntPtr HWND_TOPMOST = new IntPtr(-1);

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
		
		
		
		//SetWindowLong(activeWindow, GWL_EXSTYLE,  WS_EX_LAYERED);
		//SetLayeredWindowAttributes(activeWindow, 0xa0a0a0 , 0, LWA_COLORKEY);
		//SetWindowPos(activeWindow,HWND_TOPMOST,0,0,0,0,0);
	}


	public void test()
	{
		
		
		GD.Print("YAY");

		IntPtr activeWindow = GetActiveWindow();
		
		MARGINS mar = new MARGINS{cxLeftWidth = -1};
		
		uint hr = DwmExtendFrameIntoClientArea(activeWindow,ref mar);
		
		
		GD.Print(hr);

		
	}
	

//  // Called every frame. 'delta' is the elapsed time since the previous frame.
//  public override void _Process(float delta)
//  {
//      
//  }
}

/*

using Godot;
using System;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.InteropServices;

public class TestScene : Node
{

	public const int GWL_EXSTYLE = -20;
	public const int WS_EX_LAYERED = 0x80000;
	public const int LWA_ALPHA = 0x2;
	public const int LWA_COLORKEY = 0x1;

	[DllImport("user32.dll")]
	static extern bool SetLayeredWindowAttributes(IntPtr hwnd, uint crKey, byte bAlpha, uint dwFlags);

	[DllImport("user32.dll", SetLastError = true)]
	static extern IntPtr FindWindow(string lpClassName, string lpWindowName);

	[DllImport("user32.dll", SetLastError = true)]
	static extern int GetWindowLong(IntPtr hWnd, int nIndex);

	[DllImport("user32.dll")]
	static extern int SetWindowLong(IntPtr hWnd, int nIndex, int dwNewLong);
	
	[DllImport("user32.dll")]
	static extern IntPtr GetActiveWindow();
	
	[DllImport("user32.dll")]
	static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X, int Y, int cx, int cy, uint uFlags);
	
	private struct MARGINS{
		public int cxLeftWidth;
		public int cxRightWidth;
		public int cyTopHeight;
		public int cyBottomHeight;
	}
	
	[DllImport("Dwmapi.dll")]
	static extern uint DwmExtendFrameIntoClientArea(IntPtr hWnd,ref MARGINS margins);
	// Declare member variables here. Examples:
	// private int a = 2;
	// private string b = "text";

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		IntPtr toplevelWindow = FindWindow(null, "GameJam2021 (DEBUG)");

		if(toplevelWindow==null)
		{
			GD.Print("OH NOES");
		}

		else
		{
			GD.Print("YES");
		}
		IntPtr activeWindow = GetActiveWindow();
		
		MARGINS mar = new MARGINS{cxLeftWidth = -1};
		
		DwmExtendFrameIntoClientArea(activeWindow,ref mar);
		
		
		//SetWindowLong(activeWindow, GWL_EXSTYLE, GetWindowLong(activeWindow, GWL_EXSTYLE) | WS_EX_LAYERED);
		//SetLayeredWindowAttributes(activeWindow, 0xa0a0a0 , 0, LWA_COLORKEY);
	}

	

//  // Called every frame. 'delta' is the elapsed time since the previous frame.
//  public override void _Process(float delta)
//  {
//      
//  }
}
*/
