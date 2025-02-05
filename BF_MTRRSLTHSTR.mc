/*----------------------------------------------------------------------------------
	Project Name:
	Smart Application : 카드 기본폼
	Smart Version : Smart 1.0
	Copyright(c) 2014  ValueCMD Co., Ltd.
----------------------------------------------------------------------------------*/
card BF_MTRRSLTHSTR
{
	#include <include.h>
	#include "globalcard.h"
	#include "SQL.lib"
	
//	#define USE_ON_EXIT
//	#define USE_ON_CHAR
//	#define USE_ON_KEY
//	#define USE_ON_DRAW
//	#define USE_ON_TIMER
//	#define USE_ON_POINTING
//	#define USE_ON_SELECT

	#include "DefEvent.h"
	
	//BUTTON ID define
	BEGIN_BUTTON_ID()
		DEF_BUTTON_ID ( BID_UP )
		DEF_BUTTON_ID ( BID_DOWN )
		DEF_BUTTON_ID ( BID_OK )
	//화면 상단 공통 메뉴 모음
		DEF_BUTTON_ID ( BID_HOME )		//홈
		DEF_BUTTON_ID ( BID_MENU )		//메뉴
		DEF_BUTTON_ID ( BID_KEYBOARD )	//키보드
		DEF_BUTTON_ID ( BID_SCREEN )	//화면 상하
		DEF_BUTTON_ID ( BID_CMMNWORK )	//공통업무
		DEF_BUTTON_ID ( BID_PREV )		//이전
		DEF_BUTTON_ID ( BID_EXIT )		//종료
	END_BUTTON_ID()
	
	BEGIN_OBJECT_ID()
//리스트
		DEF_OBJECT_ID ( TXT_TITLE )			//타이틀
		DEF_OBJECT_ID ( TXT_PAGE )			//총페이지
		DEF_OBJECT_ID ( TXT_DATA1 )
		DEF_OBJECT_ID ( TXT_DATA2 )
		DEF_OBJECT_ID ( TXT_DATA3 )
		DEF_OBJECT_ID ( TXT_DATA4 )
		DEF_OBJECT_ID ( TXT_DATA5 )
		DEF_OBJECT_ID ( TXT_DATA6 )
		DEF_OBJECT_ID ( TXT_DATA7 )
		DEF_OBJECT_ID ( TXT_DATA8 )


//리스트
		DEF_OBJECT_ID ( ID_TBLLIST )	// 테이블 리스트
		
		DEF_OBJECT_ID ( ICON_TITLE )
		
	END_OBJECT_ID()
	
	//-------------------------------------------------------------------------------------------------	
	//	Table정의에 관련된 내용들
	//-------------------------------------------------------------------------------------------------
	#define		ROW 	    8					// table의 행개수
	#define		COL 	    3					// table의 열개수
	#define		GRID_H		(CHT+25)			// table 행 높이
	#define		GRID_CLR	TRANSPARENT   		// table 클리어 color
	#define		GRID_X		STARTX 			    // table 시작x좌표
	#define		MAXCHAR		201 			    // table에 들어갈수 있는 최대  char 길이
	#define		GRID_Y		STARTY+140  	    // table 시작y좌표
	#define		GRID_ENDY	(GRID_Y+(ROW+1)*GRID_H) //table마지막 row의 Y값
	
	char	m_szTableBuf [COL*(ROW+1)*MAXCHAR]; // 각 CELL에 들어가 텍스트 내용을 담은 버퍼
		
	Column m_stGridTitle[] = {
		{"신청구분", CWD*13, EDITALIGN_LEFT|EDITALIGN_MIDDLE,    TABLE_TEXT, 0},
		{"공사구분", CWD*13 , EDITALIGN_CENTER|EDITALIGN_MIDDLE,  TABLE_TEXT, 0},
		{"공사유형", CWD*13 , EDITALIGN_CENTER|EDITALIGN_MIDDLE,  TABLE_TEXT, 0}
	};	
	
	#define INIT_MAIN	1	
	
	long m_lpage = 0;			// 현재 페이지
	long m_lTotpage = 0;		// 총 페이지
	long m_lstartidx = 0;
	long m_nActIndex = -1;
	char m_szCnt_page[10];		// 페이지 표시 변수
	char m_szCobSel[20];
	
	void SetStyle(void);
	void SetBtnImg(void);
	
	SysButCtrl SysButRes_MAIN[] =
	 {
		  SYS_BUT_IMG (  BTNX_1, BTNY_1, BTNWD_1, BTNHT_1, 0, 0, BUTSTY_BOLD , 0, 0, 0, OBJ_BUT, GID_HOME,  0),
		  SYS_BUT_IMG (  BTNX_2, BTNY_1, BTNWD_1, BTNHT_1, 0, 0, BUTSTY_BOLD , 0, 0, 0, OBJ_BUT, GID_KEYBOARD,  0),
		  SYS_BUT_IMG (  BTNX_3, BTNY_1, BTNWD_1, BTNHT_1, 0, 0, BUTSTY_BOLD , 0, 0, 0, OBJ_BUT, GID_SCREEN, 0),
		  SYS_BUT_IMG (  BTNX_4, BTNY_1, BTNWD_1, BTNHT_1, 0, 0, BUTSTY_BOLD , 0, 0, 0, OBJ_BUT, GID_CMMNWK,  0),
		  SYS_BUT_IMG (  BTNX_5, BTNY_1, BTNWD_1, BTNHT_1, 0, 0, BUTSTY_BOLD , 0, 0, 0, OBJ_BUT, GID_VMEXIT, 0),
		  SYS_BUT_IMG (  BTNX_6, BTNY_2, BTNWD_2, BTNHT_2, 0, 0, BUTSTY_BOLD|BUTSTY_BORDER , 0, TRANSPARENT, TRANSPARENT, OBJ_BUT, GID_MENU, 0),
		  SYS_BUT_IMG (  BTNX_7, BTNY_2, BTNWD_2, BTNHT_2, 0, 0, BUTSTY_BOLD|BUTSTY_BORDER , 0, TRANSPARENT, TRANSPARENT, OBJ_BUT, GID_PREV, 0),
	 };
	
	// 메인 다이얼로그
	//---------------------------------------------------------------
	DlgObject	DlgRes[] = 
	{
		NORM_DLG ("", "", DLGSTY_HSCROLLBAR|DLGSTY_VSCROLLBAR|DLGSTY_TITLE, 0, MAINBKCOLOR, WHITE, BLUE, TITLE_HEIGHT, 0),
		DLG_ICON(0, BTNY_2, ICON_TITLE, ""),
		//타이틀
		DLG_TEXT(TX, TY, STWD, STHT, 0, 0, EDITSTY_BORDER, EDITSTY_BOLD, TTLCTRLFR, TTLCTRLBK, TXT_TITLE, "시설전 자료수신확인(실적조회)"),
		
		DLG_BUTTON(STARTX+620, STARTY+800, 350, 70, 0, 0, BUTSTY_BORDER|BUTSTY_BOLD, 0, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_OK, "확인"),
		DLG_BUTTON(STARTX,     STARTY+800, 200, 60, 0, 0, BUTSTY_BORDER|BUTSTY_BOLD, 0, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_UP, " ▲"),
		DLG_BUTTON(STARTX+220, STARTY+800, 200, 60, 0, 0, BUTSTY_BORDER|BUTSTY_BOLD, 0, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_DOWN, " ▼"),
		
		DLG_TEXT(STARTX+720,  STARTY+70,  250, 60, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTINCTRLBK, TXT_PAGE, m_szCnt_page), 	//현재페이지/총페이지
		DLG_TEXT(STARTX,      STARTY+70,  180, 60, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTCTRLBK, TXT_DATA1, "전체"),
		DLG_TEXT(STARTX+180,  STARTY+70,  250, 60, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA7, ""),			
		DLG_TEXT(STARTX,      STARTY+725, 170, 60, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTCTRLBK, TXT_DATA2, "대상"),
		DLG_TEXT(STARTX+170,  STARTY+725, 145, 60, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA3, ""),
		DLG_TEXT(STARTX+315,  STARTY+725, 170, 60, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTCTRLBK, TXT_DATA4, "진행"),
		DLG_TEXT(STARTX+485,  STARTY+725, 145, 60, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA5, ""),
		DLG_TEXT(STARTX+630,  STARTY+725, 170, 60, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTCTRLBK, TXT_DATA6, "송신"),
		DLG_TEXT(STARTX+800,  STARTY+725, 170, 60, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA7, ""),			
		
		// 리스트
		DLG_TABLE (GRID_X, GRID_Y, ROW, COL, 0, GRID_H, 1, GRID_H, SEL_ROW, MAXCHAR, m_stGridTitle, ID_TBLLIST, m_szTableBuf),	
	};	
	
	// PDA 다이얼로그
	//---------------------------------------------------------------
	DlgObject	DlgRes_P[] = 
	{
		NORM_DLG ("", "", DLGSTY_HSCROLLBAR|DLGSTY_VSCROLLBAR|DLGSTY_TITLE, 0, MAINBKCOLOR, WHITE, BLUE, TITLE_HEIGHT, 0),		
		DLG_ICON(0, 0, ICON_TITLE, ""),
		//타이틀
		DLG_TEXT(P_TX, P_TY, P_STWD, P_STHT, 0, 0, EDITSTY_BORDER, EDITSTY_BOLD, WHITE, TRANSPARENT, TXT_TITLE, "시설전 자료수신확인(실적조회)"),
		DLG_BUTTON(P_BTNX, P_BTNY, P_BTNWD, P_BTNHD, 0, 0, BUTSTY_BORDER, 0, BTNMENUFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", GID_PREV, ""),
				
		DLG_BUTTON(STARTX+620, STARTY+800, 350, 70, 0, 0, BUTSTY_BORDER|BUTSTY_BOLD, 0, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_OK, "확인"),
		
		DLG_TEXT(STARTX+670,  STARTY+70,  300, 60, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTCTRLBK, TXT_PAGE, m_szCnt_page), 	//현재페이지/총페이지
		DLG_TEXT(STARTX,      STARTY+70,  300, 60, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTCTRLBK, TXT_DATA1, "전체"),
		DLG_TEXT(STARTX+300,  STARTY+70,  300, 60, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA7, ""),			
		DLG_TEXT(STARTX,      STARTY+725, 170, 60, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTCTRLBK, TXT_DATA2, "대상"),
		DLG_TEXT(STARTX+170,  STARTY+725, 145, 60, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA3, ""),
		DLG_TEXT(STARTX+315,  STARTY+725, 170, 60, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTCTRLBK, TXT_DATA4, "진행"),
		DLG_TEXT(STARTX+485,  STARTY+725, 145, 60, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA5, ""),
		DLG_TEXT(STARTX+630,  STARTY+725, 170, 60, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTCTRLBK, TXT_DATA6, "송신"),
		DLG_TEXT(STARTX+800,  STARTY+725, 170, 60, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA7, ""),			
		
		// 리스트
		DLG_TABLE (GRID_X, GRID_Y, ROW, COL, 0, GRID_H, 1, GRID_H, SEL_ROW, MAXCHAR, m_stGridTitle, ID_TBLLIST, m_szTableBuf),	
	};	

	//----------------------------------------------------------------------
	bool	main (quad MsgType, quad wParam, quad lParam)
	{
		EVENT_HANDLER (MsgType, wParam, lParam);
		return TRUE;
	}
	
//┌─────────────────────────────────────┐
//│ 				   『	OnInit Function  』  				              │
//└─────────────────────────────────────┘
	void	OnInit(char bFirst)
	{
		switch (bFirst)
		{
			case INIT_MAIN:
				switch (theDevInfo.m_nType)
				{
					case FAMILY_PDA:
						CREATE_DIALOG_OBJECT (DlgRes_P, SIZEOF(DlgRes_P));

						SetBtnImg();
						SetStyle();
						break;
					default:
						CREATE_GLOBAL_BUTTON (SysButRes_MAIN);
						CREATE_DIALOG_OBJECT (DlgRes, SIZEOF(DlgRes));
						
						SetBtnImg();
						SetStyle();
				}
				break;
		}
	}

//------------------------------------------------------------------
	void SetBtnImg(void)
	{
		void* h;
		
		IconCtrl_SetImage(Get_hDlgCtrlByID(ICON_TITLE), 0, g_pImgMainTtl );		//타이틀
		EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_TITLE), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
		
		if( theDevInfo.m_nType != FAMILY_PDA )
		{	
			//상단공통메뉴
			h = GetSysButHandle(GID_HOME);
			ButCtrl_SetImage( h,  g_pImgHomeI);
			ButCtrl_SetActiveImage( h,  g_pImgHomeA);
			
			h = GetSysButHandle(GID_KEYBOARD);
			ButCtrl_SetImage( h,  g_pImgKeybrdI);
			ButCtrl_SetActiveImage( h,  g_pImgKeybrdA);
			
			h = GetSysButHandle(GID_SCREEN);
			ButCtrl_SetImage( h,  g_pImgScreenI);
			ButCtrl_SetActiveImage( h,  g_pImgScreenA);
			
			h = GetSysButHandle(GID_CMMNWK);
			ButCtrl_SetImage( h,  g_pImgCmmnwrkI);
			ButCtrl_SetActiveImage( h,  g_pImgCmmnwrkA);
			
			h = GetSysButHandle(GID_VMEXIT);
			ButCtrl_SetImage( h,  g_pImgExitI);
			ButCtrl_SetActiveImage( h,  g_pImgExitA);
		}
	}

//-----------------------------------------------------------------
	void	OnButton(long ID)
	{	
		switch(ID)
		{	
			case BID_UP:
			/*
				m_lpage--;
				if(m_lpage < 0)
				{
					m_lpage = 0;
					MessageBoxEx (CONFIRM_OK, "첫번째 페이지 입니다.");
					REDRAW();
					return;
				}
				REDRAW();
			*/
				break;			
			case BID_DOWN:
			/*
				m_lpage++ ;
				if( m_lpage > m_lTotpage-1 )
				{
					m_lpage = m_lTotpage-1;
					if(m_lpage < 0)
					{
						m_lpage = 0;
					}
					MessageBoxEx (CONFIRM_OK, "마지막 페이지 입니다.");
					REDRAW();
					break;
				}
				REDRAW();
			*/
				break;		
			case GID_HOME:
				Card_Move("MENU");
				break;
			case GID_MENU:
				Card_Move("BF_MENU");
				break;
			case GID_KEYBOARD:
				g_SHOW_SIP();
				break;
			case GID_SCREEN:
				g_MOVE_DLG(400);
				break;
			case GID_CMMNWK:
				break;				
			case GID_PREV:
				Card_Move("BF_MTRMENU");
				break;	
			case GID_VMEXIT:
				g_Exit();
				break;
		}
	}
	
//-----------------------------------------------------------------
	void	SetStyle(void)
	{
		EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_PAGE), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
		EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA1), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
		EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA2), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
		EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA3), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
		EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA4), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
		EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA5), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
		EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA6), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
		EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA7), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
	}
}
