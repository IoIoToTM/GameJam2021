using Godot;
using System;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.InteropServices;

public class Transparency : Node2D
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
	static extern uint GetWindowLong(IntPtr hWnd, int nIndex);

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
	// Declare member variables here. Examples:
	// private int a = 2;
	// private string b = "text";

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{


		 GD.Print("NOOOO");
		//GD.Print("NOOOOx1.5");
		IntPtr activeWindow = GetActiveWindow();

		//GD.Print("NOOOOx2");
		SetWindowLong(activeWindow, GWL_EXSTYLE, WS_EX_LAYERED);

		//GD.Print("NOOOOx3");
		// Set transparency color
		bool d = SetLayeredWindowAttributes(activeWindow, 0x00000000, 255, LWA_ALPHA);
		//GD.Print(d);

		//GD.Print("NOOOOx4");


		bricks = new bool[18, 32];

		for (int i = 0; i < 18; i++)
		{
			for (int j = 0; j < 32; j++)
			{
				bricks[i,j] = false;
			}
		}

		
	}
	
	bool[,] bricks;
	
	
	public void makeRandomBrickFall()
	{
		//18 x 32
		var rand = new Random();

		int randBrick1 = rand.Next(0, 18);
		int randBrick2 = rand.Next(0, 32);

		GD.Print("WOW");

		Sprite test = GetNode<Sprite>("Node2D");


		GD.Print("WOW2");
		

		//test.RemoveAndSkip();

	}

//  // Called every frame. 'delta' is the elapsed time since the previous frame.
//  public override void _Process(float delta)
//  {
//      
//  }
}
