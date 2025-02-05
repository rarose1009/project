/*----------------------------------------------------------------------------------
	Project Name:
	Smart Application : 카드 기본폼
	Smart Version : Smart 1.0
	Copyright(c) 2014  ValueCMD Co., Ltd.
----------------------------------------------------------------------------------*/
card GM_SELSND_1
{
	#include <include.h>
	#include "globalcard.h"
	
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
		DEF_BUTTON_ID ( BID_SEND )			//송신하기
		DEF_BUTTON_ID ( BID_DELETE )		//삭제하기
		DEF_BUTTON_ID ( BID_DAYEND )		//일마감
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
		DEF_OBJECT_ID ( TXT_TITLE )				//타이틀
		DEF_OBJECT_ID ( TXT_GOOBOON )			//구분
		DEF_OBJECT_ID ( TXT_INFO )				//내용
		DEF_OBJECT_ID ( TXT_NOTIFYDT )			//고지년월
		DEF_OBJECT_ID ( TXT_PERIODPAY )			//납기
		DEF_OBJECT_ID ( TXT_OBJNUM )			//대상수
		DEF_OBJECT_ID ( TXT_GMNUM )				//검침수
		DEF_OBJECT_ID ( TXT_SENDNUM )			//송신수
		DEF_OBJECT_ID ( TXT_NSENDNUM )			//미송신수
		DEF_OBJECT_ID ( TXT_DATA1 )				//고지년월 텍스트
		DEF_OBJECT_ID ( TXT_DATA2 )				//납기 텍스트
		DEF_OBJECT_ID ( TXT_DATA3 )				//대상수 텍스트
		DEF_OBJECT_ID ( TXT_DATA4 )				//검침수 텍스트
		DEF_OBJECT_ID ( TXT_DATA5 )				//송신수 텍스트
		DEF_OBJECT_ID ( TXT_DATA6 )				//미송신수 텍스트
	END_OBJECT_ID()
	
	#define INIT_MAIN	1
	
	void SetStyle(void);
	
	// 메인 다이얼로그
	//---------------------------------------------------------------
	DlgObject	DlgRes[] = 
	{
		NORM_DLG ("", "", DLGSTY_HSCROLLBAR|DLGSTY_VSCROLLBAR|DLGSTY_TITLE, 0, MAINBKCOLOR, WHITE, BLUE, TITLE_HEIGHT, 0),		
		//타이틀
		DLG_TEXT(TX, TY, STWD, STHT, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, TXTCTRLBK, TXT_TITLE, "검 침 - 자 료 송 신 & 삭 제"),
		
		//화면 공통 메뉴
		DLG_BUTTON(STARTX,      5, 145, 70, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", BID_HOME, "HOME"),
		DLG_BUTTON(STARTX+150,  5, 135, 70, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", BID_MENU, "메뉴"),
		DLG_BUTTON(STARTX+290,  5, 135, 70, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", BID_KEYBOARD, "자판"),
		DLG_BUTTON(STARTX+430,  5, 135, 70, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", BID_SCREEN,  "화면"),
		DLG_BUTTON(STARTX+570,  5, 135, 70, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", BID_CMMNWORK,"공통"),
		DLG_BUTTON(STARTX+710,  5, 135, 70, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", BID_PREV,  "이전"),
		DLG_BUTTON(STARTX+850,  5, 130, 70, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", BID_EXIT, "종료"),
			
		DLG_BUTTON(STARTX+100, STARTY+660, 350, 70, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_SEND, "자 료 송 신"),
		DLG_BUTTON(STARTX+550, STARTY+660, 350, 70, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_DELETE, "자 료 삭 제"),
		DLG_BUTTON(STARTX+200, STARTY+750, 600, 70, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_DAYEND, "일 마 감"),
		
		DLG_TEXT(STARTX+100, STARTY+110, 400, 70, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_GOOBOON, "구 분"),
		DLG_TEXT(STARTX+500, STARTY+110, 380, 70, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_INFO, "내 용"),
		DLG_TEXT(STARTX+100, STARTY+180, 400, 70, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_NOTIFYDT, "고 지 년 월"),
		DLG_TEXT(STARTX+100, STARTY+250, 400, 70, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_PERIODPAY, "납 기"),
		DLG_TEXT(STARTX+100, STARTY+320, 400, 70, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_OBJNUM, "대 상 수"),
		DLG_TEXT(STARTX+100, STARTY+390, 400, 70, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_GMNUM, "검 침 수"),
		DLG_TEXT(STARTX+100, STARTY+460, 400, 70, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_SENDNUM, "송 신 수"),
		DLG_TEXT(STARTX+100, STARTY+530, 400, 70, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_NSENDNUM, "미 송 신 수"),
		DLG_TEXT(STARTX+500, STARTY+180, 380, 70, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA1, ""),	//고지년월 텍스트
		DLG_TEXT(STARTX+500, STARTY+250, 380, 70, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA2, ""),		//납기 텍스트
		DLG_TEXT(STARTX+500, STARTY+320, 380, 70, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA3, ""),		//대상수 텍스트
		DLG_TEXT(STARTX+500, STARTY+390, 380, 70, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA4, ""),		//검침수 텍스트
		DLG_TEXT(STARTX+500, STARTY+460, 380, 70, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA5, ""),		//송신수 텍스트
		DLG_TEXT(STARTX+500, STARTY+530, 380, 70, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA6, ""),		//미송신수 텍스트
	};	
	
	// PDA 다이얼로그
	//---------------------------------------------------------------
	DlgObject	DlgRes_P[] = 
	{
/*
		NORM_DLG ("", "", DLGSTY_HSCROLLBAR|DLGSTY_VSCROLLBAR|DLGSTY_TITLE, 0, MAINBKCOLOR, WHITE, BLUE, TITLE_HEIGHT, 0),		

		DLG_BUTTON(STARTX+100, STARTY+630, 350, 100, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_SEND, "자 료 송 신"),
		DLG_BUTTON(STARTX+550, STARTY+630, 350, 100, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_DELETE, "자 료 삭 제"),
		DLG_BUTTON(STARTX+200, STARTY+750, 600, 100, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_DAYEND, "일 마 감"),
		
		DLG_TEXT(STARTX+100, STARTY+50, 400, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_GOOBOON, "구 분"),
		DLG_TEXT(STARTX+500, STARTY+50, 380, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_INFO, "내 용"),
		DLG_TEXT(STARTX+100, STARTY+130, 400, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_NOTIFYDT, "고 지 년 월"),
		DLG_TEXT(STARTX+100, STARTY+210, 400, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_PERIODPAY, "납 기"),
		DLG_TEXT(STARTX+100, STARTY+290, 400, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_OBJNUM, "대 상 수"),
		DLG_TEXT(STARTX+100, STARTY+370, 400, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_GMNUM, "검 침 수"),
		DLG_TEXT(STARTX+100, STARTY+450, 400, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_SENDNUM, "송 신 수"),
		DLG_TEXT(STARTX+100, STARTY+530, 400, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_NSENDNUM, "미 송 신 수"),
		DLG_TEXT(STARTX+500, STARTY+130, 380, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA1, ""),		//고지년월 텍스트
		DLG_TEXT(STARTX+500, STARTY+210, 380, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA2, ""),		//납기 텍스트
		DLG_TEXT(STARTX+500, STARTY+290, 380, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA3, ""),		//대상수 텍스트
		DLG_TEXT(STARTX+500, STARTY+370, 380, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA4, ""),		//검침수 텍스트
		DLG_TEXT(STARTX+500, STARTY+450, 380, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA5, ""),		//송신수 텍스트
		DLG_TEXT(STARTX+500, STARTY+530, 380, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA6, ""),		//미송신수 텍스트
*/
		NORM_DLG ("", "", DLGSTY_HSCROLLBAR|DLGSTY_VSCROLLBAR|DLGSTY_TITLE, 0, MAINBKCOLOR, WHITE, BLUE, TITLE_HEIGHT, 0),		

		DLG_BUTTON(STARTX+100, STARTY+580, 350, 100, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_SEND, "자 료 송 신"),
		DLG_BUTTON(STARTX+550, STARTY+580, 350, 100, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_DELETE, "자 료 삭 제"),
		DLG_BUTTON(STARTX+200, STARTY+700, 600, 100, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_DAYEND, "일 마 감"),
		
		DLG_TEXT(STARTX+100, STARTY, 400, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_GOOBOON, "구 분"),
		DLG_TEXT(STARTX+500, STARTY, 380, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_INFO, "내 용"),
		DLG_TEXT(STARTX+100, STARTY+80, 400, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_NOTIFYDT, "고 지 년 월"),
		DLG_TEXT(STARTX+100, STARTY+160, 400, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_PERIODPAY, "납 기"),
		DLG_TEXT(STARTX+100, STARTY+240, 400, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_OBJNUM, "대 상 수"),
		DLG_TEXT(STARTX+100, STARTY+320, 400, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_GMNUM, "검 침 수"),
		DLG_TEXT(STARTX+100, STARTY+400, 400, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_SENDNUM, "송 신 수"),
		DLG_TEXT(STARTX+100, STARTY+480, 400, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTCTRLBK, TXT_NSENDNUM, "미 송 신 수"),
		DLG_TEXT(STARTX+500, STARTY+80, 380, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA1, ""),		//고지년월 텍스트
		DLG_TEXT(STARTX+500, STARTY+160, 380, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA2, ""),		//납기 텍스트
		DLG_TEXT(STARTX+500, STARTY+240, 380, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA3, ""),		//대상수 텍스트
		DLG_TEXT(STARTX+500, STARTY+320, 380, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA4, ""),		//검침수 텍스트
		DLG_TEXT(STARTX+500, STARTY+400, 380, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA5, ""),		//송신수 텍스트
		DLG_TEXT(STARTX+500, STARTY+480, 380, 80, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA6, ""),		//미송신수 텍스트

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
						SetStyle();
						break;
					default:
						CREATE_DIALOG_OBJECT (DlgRes, SIZEOF(DlgRes));
						EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_TITLE), EDITALIGN_MIDDLE);
						
						SetStyle();
						break;		
				}
				break;
		}
	}

//-----------------------------------------------------------------
void	SetStyle(void)
{
	EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_GOOBOON), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
	EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_INFO), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
	EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_NOTIFYDT), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
	EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_PERIODPAY), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
	EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_OBJNUM), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
	EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_GMNUM), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
	EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_SENDNUM), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
	EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_NSENDNUM), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
}

//------------------------------------------------------------------
	void	OnButton(long ID)
	{	
		switch(ID)
		{					
			case BID_SEND:
				break;
			case BID_DELETE:
				break;
			case BID_DAYEND:
				break;				
			case BID_HOME:
				Card_Move("MENU");
				break;
			case BID_MENU:
				Card_Move("GM_MENU");
				break;
			case BID_KEYBOARD:
				break;
			case BID_SCREEN:
				break;
			case BID_CMMNWORK:
				break;
			case BID_PREV:
				Card_Move("GM_DMMENU");
				break;	
			case BID_EXIT:
				g_Exit();
				break;
		}
	}		
}


