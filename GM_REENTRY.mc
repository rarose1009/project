/*----------------------------------------------------------------------------------
	Project Name:
	Smart Application : 카드 기본폼
	Smart Version : Smart 1.0
	Copyright(c) 2014  ValueCMD Co., Ltd.
----------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------
	Card Name : GM_REENTRY
	Card Desc : 검침등록화면
	Card Hist :
----------------------------------------------------------------------------------*/
card GM_REENTRY
{
	#include <include.h>
	#include "globalcard.h"
	#include "SQL.lib"
	#include "Biglong.lib"
	
//	#define USE_ON_EXIT
	#define USE_ON_CHAR
	#define USE_ON_KEY
//	#define USE_ON_DRAW
//	#define USE_ON_TIMER 	
	#define USE_ON_POINTING
	#define USE_ON_SELECT
	#define USE_ON_UART
	
	#include "DefEvent.h"
	
	//---------------------------------------------------------------
	// BUTTON ID define
	//---------------------------------------------------------------
	BEGIN_BUTTON_ID()
		/****************************/
		/* 검침등록                 */
		/****************************/
		DEF_BUTTON_ID ( BID_ILLIGAL )	//불법 
		DEF_BUTTON_ID ( BID_SC )		//안전점검
		DEF_BUTTON_ID ( BID_NUM )		//상시계수
		DEF_BUTTON_ID ( BID_MESSAGE )	//메세지
		DEF_BUTTON_ID ( BID_BIZ )		//사업자등록증
		DEF_BUTTON_ID ( BID_ADDR1 )		//지번
		DEF_BUTTON_ID ( BID_ADDR2 )		//상호
		DEF_BUTTON_ID ( BID_ADDR3 )		//공백
		DEF_BUTTON_ID ( BID_ADDR4 )		//기물
		DEF_BUTTON_ID ( BID_ADDR5 )		//TEL
		DEF_BUTTON_ID ( BID_GMSND )		//검침송신화면으로 이동
		DEF_BUTTON_ID ( BID_TEL )		//전화걸기 
		DEF_BUTTON_ID ( BID_USEQTY )	//사용량
		DEF_BUTTON_ID ( BID_SILSA )		//실사
		DEF_BUTTON_ID ( BID_SMS_STS )	//문자검침발송진행상태

		DEF_BUTTON_ID ( BID_ZERO )		//0
		DEF_BUTTON_ID ( BID_ONE )		//1
		DEF_BUTTON_ID ( BID_TWO )		//2
		DEF_BUTTON_ID ( BID_THREE )		//3
		DEF_BUTTON_ID ( BID_FOUR )		//4
		DEF_BUTTON_ID ( BID_FIVE )		//5
		DEF_BUTTON_ID ( BID_SIX )		//6
		DEF_BUTTON_ID ( BID_SEVEN )		//7
		DEF_BUTTON_ID ( BID_EIGHT )		//8
		DEF_BUTTON_ID ( BID_NINE )		//9
		
		DEF_BUTTON_ID ( BID_PREVPG )	//이전페이지
		DEF_BUTTON_ID ( BID_NEXTPG )	//다음페이지
		DEF_BUTTON_ID ( BID_NUMDEL )	//입력숫자삭제
		DEF_BUTTON_ID ( BID_DELETE )	//삭제
		DEF_BUTTON_ID ( BID_SAVE )		//저장
		DEF_BUTTON_ID ( BID_FEE )		//요금
		DEF_BUTTON_ID ( BID_CALCUL )	//계산
		DEF_BUTTON_ID ( BID_CLIENT )	//고객
		DEF_BUTTON_ID ( BID_MEMO )		//메모		
		DEF_BUTTON_ID ( BID_THMONTH )	//당월
		DEF_BUTTON_ID ( BID_REMOTE )	//원격지침
		
		DEF_BUTTON_ID ( BID_MTR_ID_NUM ) //기물
		DEF_BUTTON_ID ( BID_MENU ) 		 //메뉴
		
		/****************************/
		/* 상세지침내역             */
		/****************************/
		DEF_BUTTON_ID ( BID_OK )		//확인
		
		/****************************/
		/* 상세지침내역 - 보정기    */
		/****************************/
		DEF_BUTTON_ID ( BID_OK2 )		//확인
		
		/****************************/
		/* 상시계수입력             */
		/****************************/
		DEF_BUTTON_ID ( BID_SAVE2 )		//저장
		DEF_BUTTON_ID ( BID_CLOSE2 )	//닫기
		DEF_BUTTON_ID ( BID_PHOTO_VC )	//VC사진
		DEF_BUTTON_ID ( BID_PHOTO_VA )	//VA사진
		DEF_BUTTON_ID ( BID_PHOTO_VM )	//VM사진
		
		/****************************/
		/* 사용량 이상 세대         */
		/****************************/
		DEF_BUTTON_ID ( BID_POPPREV )
		DEF_BUTTON_ID ( BID_SAVE3 )		//저장
		DEF_BUTTON_ID ( BID_BOX1 )		//체크박스버튼
		DEF_BUTTON_ID ( BID_BOX2 )		//체크박스버튼
		DEF_BUTTON_ID ( BID_BOX3 )		//체크박스버튼
		DEF_BUTTON_ID ( BID_BOX4 )		//체크박스버튼
		
		/****************************/
		/* 보정기 삭제              */
		/****************************/
		DEF_BUTTON_ID ( BID_COMPENS_SIGN )		//보정기_서명
		DEF_BUTTON_ID ( BID_COMPENS_CLOSE )		//보정기_닫기
		DEF_BUTTON_ID ( BID_COMPENS_OK )		//보정기_저장
		DEF_BUTTON_ID ( BID_COMPENS_CONF_NM )	//보정기_지침_화면전환
		
	END_BUTTON_ID()
	
	//---------------------------------------------------------------
	// OBJECT ID define
	//---------------------------------------------------------------
	BEGIN_OBJECT_ID()
		/****************************/
		/* 타이틀                   */
		/****************************/
		DEF_OBJECT_ID ( TXT_TITLE )	
		DEF_OBJECT_ID ( ICON_TITLE )		
		
		/****************************/
		/* 검침                     */
		/****************************/
		DEF_BUTTON_ID ( TXT_ZERO )		//0
		DEF_BUTTON_ID ( TXT_ONE )		//1
		DEF_BUTTON_ID ( TXT_TWO )		//2
		DEF_BUTTON_ID ( TXT_THREE )		//3
		DEF_BUTTON_ID ( TXT_FOUR )		//4
		DEF_BUTTON_ID ( TXT_FIVE )		//5
		DEF_BUTTON_ID ( TXT_SIX )		//6
		DEF_BUTTON_ID ( TXT_SEVEN )		//7
		DEF_BUTTON_ID ( TXT_EIGHT )		//8
		DEF_BUTTON_ID ( TXT_NINE )		//9
		DEF_BUTTON_ID ( TXT_NUMDEL )	//백스페이스
		DEF_BUTTON_ID ( TXT_PREVPG )	//이전
		DEF_BUTTON_ID ( TXT_NEXTPG )	//이후
		
		DEF_OBJECT_ID ( TXT_DATA1 )		//페이지수
		DEF_OBJECT_ID ( TXT_DATA2 )		//검침일
		DEF_OBJECT_ID ( TXT_DATA3 )		//주소
		DEF_OBJECT_ID ( TXT_DATA4 )		//매월
		DEF_OBJECT_ID ( TXT_DATA5 )		//상품
		DEF_OBJECT_ID ( TXT_DATA7 )		//상호
		DEF_OBJECT_ID ( TXT_DATA8 )		//청구방법
		
		DEF_OBJECT_ID ( TXT_DATA11 )	//전월
		DEF_OBJECT_ID ( TXT_DATA12 )	//전전월
		DEF_OBJECT_ID ( TXT_DATA13 )	//교체일
		DEF_OBJECT_ID ( TXT_DATA14 )	//교체날짜
		DEF_OBJECT_ID ( TXT_DATA15 )	//지침
		DEF_OBJECT_ID ( TXT_DATA16 )	//전월검침코드_1 
		
		DEF_OBJECT_ID ( TXT_DATA17 )	//전월검침코드_1, 전월지침_보정기_VC_1 
		DEF_OBJECT_ID ( TXT_DATA18 )	//전월지침_보정기_VC_1, 전월지침_계량기_1
		DEF_OBJECT_ID ( TXT_DATA19 )	//전월사용량_1, 전월지침_보정기_VA_1 
		DEF_OBJECT_ID ( TXT_DATA20 )	//전월검침코드_2, 전월지침_계량기_1, 전월지침_보정기_VC_2 
		DEF_OBJECT_ID ( TXT_DATA21 )	//전월지침_보정기_VC_2, 전월검침코드_2
		DEF_OBJECT_ID ( TXT_DATA22 )	//전월사용량_3, 전월지침_보정기_VC_2 
		DEF_OBJECT_ID ( TXT_DATA23 )	//전월지침_보정기_VA_2 
		DEF_OBJECT_ID ( TXT_DATA24 )	//전월지침_계량기_2 
		
		DEF_OBJECT_ID ( TXT_DATA97 )	//고객성향
		DEF_OBJECT_ID ( TXT_DATA98 )	//검침송달여부
		DEF_OBJECT_ID ( TXT_DATA99 )	//계량기위치
		
		/****************************/
		/* 상세지침내역             */
		/****************************/
		DEF_OBJECT_ID ( TXT_DATA25 )	//구분
		DEF_OBJECT_ID ( TXT_DATA26 )	//전월지침
		DEF_OBJECT_ID ( TXT_DATA27 )	//전전월
		DEF_OBJECT_ID ( TXT_DATA28 )	//전년동월
		DEF_OBJECT_ID ( TXT_DATA29 )	//지침
		DEF_OBJECT_ID ( TXT_DATA30 )	//지침_전월지침
		DEF_OBJECT_ID ( TXT_DATA31 )	//지침_전전월
		DEF_OBJECT_ID ( TXT_DATA32 )	//지침_전년동월
		DEF_OBJECT_ID ( TXT_DATA33 )	//사용량
		DEF_OBJECT_ID ( TXT_DATA34 )	//사용량_전월지침
		DEF_OBJECT_ID ( TXT_DATA35 )	//사용량_전전월
		DEF_OBJECT_ID ( TXT_DATA36 )	//사용량_전년동월
		
		/****************************/
		/* 상세지침내역_보정기      */
		/****************************/
		DEF_OBJECT_ID ( TXT_DATA37 )	//구분
		DEF_OBJECT_ID ( TXT_DATA38 )	//전월지침
		DEF_OBJECT_ID ( TXT_DATA39 )	//전전월
		DEF_OBJECT_ID ( TXT_DATA40 )	//전년동월
		DEF_OBJECT_ID ( TXT_DATA41 )	//VC
		DEF_OBJECT_ID ( TXT_DATA42 )	//VC_전월지침
		DEF_OBJECT_ID ( TXT_DATA43 )	//VC_전전월
		DEF_OBJECT_ID ( TXT_DATA44 )	//VC_전년동월
		DEF_OBJECT_ID ( TXT_DATA45 )	//VA
		DEF_OBJECT_ID ( TXT_DATA46 )	//VA_전월지침
		DEF_OBJECT_ID ( TXT_DATA47 )	//VA_전전월
		DEF_OBJECT_ID ( TXT_DATA48 )	//VA_전년동월
		DEF_OBJECT_ID ( TXT_DATA49 )	//VM
		DEF_OBJECT_ID ( TXT_DATA50 )	//VM_전월지침
		DEF_OBJECT_ID ( TXT_DATA51 )	//VM_전전월
		DEF_OBJECT_ID ( TXT_DATA52 )	//VM_전년동월
		DEF_OBJECT_ID ( TXT_DATA53 )	//사용량
		DEF_OBJECT_ID ( TXT_DATA54 )	//사용량_전월지침
		DEF_OBJECT_ID ( TXT_DATA55 )	//사용량_전전월
		DEF_OBJECT_ID ( TXT_DATA56 )	//사용량_전년동월
		
		/****************************/
		/* 상시계수입력             */
		/****************************/
		DEF_OBJECT_ID ( TXT_DATA57 )	//상시온도
		DEF_OBJECT_ID ( TXT_DATA58 )	//℃
		DEF_OBJECT_ID ( TXT_DATA59 )	//상시압력
		DEF_OBJECT_ID ( TXT_DATA60 )	//Kpa
		DEF_OBJECT_ID ( TXT_DATA61 )	//보정계수
		
		/****************************/
		/* 사용량 이상세대          */
		/****************************/
		DEF_OBJECT_ID ( TXT_DATA62 )	//선택
		DEF_OBJECT_ID ( TXT_DATA63 )	//구분
		DEF_OBJECT_ID ( TXT_DATA65 )	//정상(사용량 감소)	
		DEF_OBJECT_ID ( TXT_DATA67 )	//비정상(계량기 이상)
		DEF_OBJECT_ID ( TXT_DATA69 )	//비정상(보정장치 이상)
		DEF_OBJECT_ID ( TXT_DATA71 )	//비정상(기타)
		
		/****************************/
		/* 사용량(계량기 사용량)    */
		/****************************/
		DEF_OBJECT_ID ( TXT_USEQTY )	//EDT_DATA1 에서 텍스트로 변경
		
		/****************************/
		/* 보정기 삭제              */
		/****************************/
		DEF_OBJECT_ID ( TXT_COMPENS_MAIN )		//TXT_보정기
		DEF_OBJECT_ID ( TXT_COMPENS_CONF_NM )	//TXT_확인자
		DEF_OBJECT_ID ( EDT_COMPENS_CONF_NM )	//EDT_확인자
		DEF_OBJECT_ID ( LINE_DATA1 )			//라인
		
		/****************************/
		/* LINE                     */
		/****************************/
		DEF_OBJECT_ID ( LINE_DATA_1 )	// 라인_1
		DEF_OBJECT_ID ( LINE_DATA_2 )	// 라인_2
		
		/****************************/
		/* EDIT                     */
		/****************************/
		//검침등록
		DEF_OBJECT_ID ( EDT_VC )
		DEF_OBJECT_ID ( EDT_VA )
		DEF_OBJECT_ID ( EDT_VM )
		
		//상시계수입력
		DEF_OBJECT_ID ( EDT_DATA4 )
		DEF_OBJECT_ID ( EDT_DATA5 )
		DEF_OBJECT_ID ( EDT_DATA6 )
		
		/****************************/
		/* COMBO                    */
		/****************************/
		//검침등록		
		DEF_OBJECT_ID ( CMB_RESULT )
	END_OBJECT_ID()
	
	//---------------------------------------------------------------
	// Define
	//---------------------------------------------------------------
	#define	EDITSETRANGE(h, x1, y1, x2, y2)		EditCtrl_SetRange(h, DMS_X(x1),DMS_Y(y1), DMS_X(x2),DMS_Y(y2) )
	#define	BUTSETRANGE(h, x1, y1, x2, y2)		ButCtrl_SetRange(h, DMS_X(x1),DMS_Y(y1), DMS_X(x2),DMS_Y(y2) )
	
	#define INIT_MAIN	 	   1 //정상검침
	#define INIT_JCHM	 	   2 //상세지침내역
	#define INIT_BJCHM	 	   3 //상세지침내역 - 보정기
	#define INIT_NUM	 	   4 //상시계수입력
	#define INIT_USE	 	   5 //사용량 이상세대
	#define INIT_COMPENSREMOVE 6 //보정기 삭제
	
	//지침 입력값 Refresh
	#define REFRESH_Y1  DMS_Y(STARTY)
	#define REFRESH_Y2  DMS_Y(STARTY+600)
	
	//메세지박스 Refresh
	#define REFRESH_MSGY1  DMS_Y(STARTY-20)
	#define REFRESH_MSGY2  DMS_Y(STARTY+500)
	
	//---------------------------------------------------------------
	// Global Param
	//---------------------------------------------------------------
	handle m_hDlg;
	
	char m_szgr[11];
	char m_szbj[11];
	char m_sztp[11];
	char m_szZonemanagenum[20];	
	char m_szObjym[15];
	char m_szChkyear[10];
	char m_szChkorder[10];
	char m_szMtr_Code[11];		//당월 검침코드
	char szAddr[201];
	char m_szPhone[50];
	char m_szName[60];
	char m_szCnt_index[11];    	//인덱스 문자열(현재 페이지/총페이지)
	char m_szIndiQty[11];
	
	char m_send_flag[2];
	char m_sms_desc_flag[2];
	char m_send_tel_flag[2];
	char m_szCpDdd[6];			//문자검침 전화번호
	char m_szCpExn[6];			//문자검침 전화번호
	char m_szCpNum[6];			//문자검침 전화번호
	char m_szchktype[3];
	char m_szobjym[7];
	char m_szchkyear[5];
	char m_szchkorder[3];
	char m_szzone_manage_num[6];
	char m_szRcvDay[9];
	char m_beforeVc[11];
	char m_szfilenm[200];
	char m_szPhoto_CompensType[2];	//보정기 사진 type : VC = 1, VA = 2, VM = 3
	
	long m_bFirst = 0;         	//화면 플래그
	long m_ltotcnt;
	long m_lNameFlag = 0;
    long m_lPhoneflag = 0;
    long m_lSmsDelFlag = 0;    	// = 0 default , = 1 문자대상 -> 업무 정상 등록 시 삭제 , = 2 검침취소(삭제) 시 삭제
    long m_lSmsStsFlag = 0;    	// = 0 문자검침 대상 상태 표시 , = 1 문자대상 -> 업무 정상(문자취소) 등록 시 상태 , = 2 검침취소(삭제) 시 상태, = 3 문자대상 등록시 상태
    long m_lSmsAgreeFlag = 0;  	// = 0 문자검침 동의 세대여부 수신 , = 1 문자검침 동의 세대여부 수신 X 후 문자대상 상태체크
	
	//팝업,업무 이동 후 다시 돌아왔을때, 입력되어있는 값을 보존하기 위한 flag	
	long m_lSetFlag = 0;		//m_lSetFlag = 0 > 디폴트		/ m_lSetFlag = 1 >업무 후
	long m_lMonitorFlag = 0;	//이상세대 플래그
	long m_lPrev = 0;	
	long m_lUserData = 0;		//검침체크룰
	long m_lEditCtrlIndex = -1; //현재 엑티브된 EDITCTRL의 인덱스
	long m_lStyle = 0;
	long m_lChk = 0;
	long m_lLastSave = 0;		//마지막대상 저장 시 문자검침 대상 여부에 따른 상태 값 수신 관리 Flag, = 0 대상X , = 1 문자대상O
	long m_maxQtySaveCnt = 0;	// 최대 사용량 넘은 경우 저장 버튼 누른 cnt
	char m_szIndiVc[10];
	
	//---------------------------------------------------------------
	// Function
	//---------------------------------------------------------------
	long FS_GetSrchTotCnt(void);	
	void SetStyle(void);
	void SetData(void);							// 스트럭쳐에 Data담기.
	void Set_Index(void);						// 선택된 인덱스를 저장한다.
	void SetTotCnt(void);						// 검침 대상의 카운트 저장
	void REDRAW(void);							// 화면에 자료 디스플레이한다.
	void JCHM_DRAW(void);
	void NUM_DRAW(void);
	void COMPENSREMOVE_DRAW(void);
	void Prev_Gm(void);							// 이전대상으로 인덱스 찾기
	void Next_Gm(void);							// 다음대상으로 인덱스 찾기
	bool Gm_ChkRule(void);						// 검침 체크룰
	void Cal_UseQty(char *szIndi_VC);			// 사용량계산
	long Save_Gm(void);							// 검침 데이터 저장
	void SaveInput(void);						// 입력값 global변수에 저장, 화면 이동으로부터 입력시킨 데이터를 보존하기위해!?
	void Del_Gm(void);
	long SearchStr(char *Str, CodeTable *CT);	// 코드 값을 찾는다.
	long SearchCD(char *CD, CodeTable *CT);		// 코드 값을 찾는다.
	void SetBtnImg(void);
	long Analy_Phone(char*phone, char* num1, char* num2, char* num3 );
	long Save_factor(void);
	long Chk_float( char * szfloat );
	long Sos_Key(void);
	void Clear_Flag(void);
	void Call_Tel(void);
	
	//문자검침 상태
	long Rcv_Many(void);
	long TR25010(void);
	long Rcv_SmsSts(void);
	long TR25008(void);
	long GmSms_Sts(long nservicenum);
	
	//문자검침 대상 등록
	long Snd_Sms_New(void);
	long TR25004(void);
	
	//문자 대상 예약취소
	long Snd_Reserve_Cancel(void);
	long TR25006(void);
	
	//문자 대상 삭제 -> 예약 취소 후 삭제 실행
	long Snd_Delete(void);
	long TR25005(void);
	
	//검침->점검 업무이동 수신 쿼리 추가 예정
	long safe_chkdata(void);
	long Read_RcvLog (void);
	long RCV311324(void);
	long TR311324(void);
	long RCV311317(void);
	long TR311317(void);
	long RCV311318(void);
	long TR311318(void);
	long RCV311311(void);
	long TR311311(void);
	long RCV311312(void);
	long TR311312(void);
	long RCV311313(void);
	long TR311313(void);
	long RCV311314(void);
	long TR311314(void);
	long RCV311315(void);
	long TR311315(void);
	long RCV311307(void);
	long TR311307(void);
	long RCV311308(void);
	long TR311308(void);
	long RCV311309(void);
	long TR311309(void);
	long RCV311310(void);
	long TR311310(void);
	long RCV311323(void);
	long TR311323(void);
	
	long Rcv_self_select(void);
	long TR25011(void);
	long SelfSelect(void);
	
	void fn_Compens_Sign(void);
	bool fn_Compens_Save(void);
	
	void Shoto_Photo_Compens( void );
	void FR26002( void );
	long TR26002( void );
	
	//---------------------------------------------------------------
	//	공통
	//---------------------------------------------------------------
	SysButCtrl SysButRes_MAIN[] =
	{
		SYS_BUT_IMG( BTNX_1, BTNY_1, BTNWD_1, BTNHT_1, 0, 0, BUTSTY_BOLD , 0, 0, 0, OBJ_BUT, GID_HOME, 0 ),
		SYS_BUT_IMG( BTNX_2, BTNY_1, BTNWD_1, BTNHT_1, 0, 0, BUTSTY_BOLD , 0, 0, 0, OBJ_BUT, GID_KEYBOARD, 0 ),
		SYS_BUT_IMG( BTNX_3, BTNY_1, BTNWD_1, BTNHT_1, 0, 0, BUTSTY_BOLD , 0, 0, 0, OBJ_BUT, GID_SCREEN, 0 ),
		SYS_BUT_IMG( BTNX_4, BTNY_1, BTNWD_1, BTNHT_1, 0, 0, BUTSTY_BOLD , 0, 0, 0, OBJ_BUT, GID_CMMNWK, 0 ),
		SYS_BUT_IMG( BTNX_5, BTNY_1, BTNWD_1, BTNHT_1, 0, 0, BUTSTY_BOLD , 0, 0, 0, OBJ_BUT, GID_VMEXIT, 0 ),
		SYS_BUT_IMG( BTNX_6, BTNY_2, BTNWD_2, BTNHT_2, 0, 0, BUTSTY_BOLD|BUTSTY_BORDER, 0, TRANSPARENT, TRANSPARENT, OBJ_BUT, GID_MENU, 0 ),
		SYS_BUT_IMG( BTNX_7, BTNY_2, BTNWD_2, BTNHT_2, 0, 0, BUTSTY_BOLD|BUTSTY_BORDER, 0, TRANSPARENT, TRANSPARENT, OBJ_BUT, GID_PREV, 0 ),
	};
	
	//---------------------------------------------------------------
	// 메인 다이얼로그
	//---------------------------------------------------------------
	DlgObject DlgRes[] =
	{
		NORM_DLG ("", "", DLGSTY_HSCROLLBAR|DLGSTY_VSCROLLBAR|DLGSTY_TITLE, 0, MAINBKCOLOR, WHITE, BLUE, TITLE_HEIGHT, 0),	
		DLG_ICON(0, BTNY_2, ICON_TITLE, ""),
		
		DLG_TEXT(TX, TY, STWD, STHT, 0, 0, EDITSTY_BORDER, EDITSTY_BOLD, TTLCTRLFR, TTLCTRLBK, TXT_TITLE, "검침 등록"),
		//DLG_BUTTON(BTNX_7, P_BTNY, BTNWD_2, BTNHT_2, 0, 0, EDITSTY_BORDER, 0, BTNMENUFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", BID_MENU, ""),
		
		DLG_BUTTON(STARTX,     STARTY+65 , 150, 50 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_GMSND,   "송신"),
		DLG_BUTTON(STARTX+150, STARTY+65 , 150, 50 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_ILLIGAL, "불법"),
		DLG_BUTTON(STARTX+300, STARTY+65 , 150, 50 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_SC,      "점검"),
		//DLG_BUTTON(STARTX+450, STARTY+65 , 200, 50 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_MESSAGE, "메세지"),
		//DLG_BUTTON(STARTX+650, STARTY+65 , 150, 50 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_SILSA, "실사"),
		DLG_BUTTON(0, 0, 0, 0, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_MESSAGE, "메세지"),
		DLG_BUTTON(0, 0, 0, 0, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_SILSA, "실사"),
		DLG_TEXT ( STARTX+800, STARTY+65 , 100, 50 , 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, GREEN, TXT_DATA97, ""), 	// 고객성향
		DLG_TEXT ( STARTX+900, STARTY+65 , 100, 50 , 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, GREEN, TXT_DATA98, ""), 	// 검침송달여부
		
		DLG_TEXT ( STARTX,     STARTY+115, 300, 50 , 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA1, m_szCnt_index),
		DLG_TEXT ( STARTX+300, STARTY+115, 100, 50 , 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA2, ""), 	// DAY
		DLG_BUTTON(STARTX+400, STARTY+115, 180, 50 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_NUM, ""), // 상시계수
		DLG_TEXT ( STARTX+580, STARTY+115, 150, 50 , 0, 0, 0, EDITSTY_BORDER, TXTTTLFRCOLOR, TXTCTRLBK, TXT_DATA4, ""), // 매
		DLG_TEXT ( STARTX+730, STARTY+115, 270, 50 , 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA5, ""), 
		
		DLG_BUTTON(STARTX,     STARTY+165, 130, 80 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_ADDR1, "지번"),
		DLG_TEXT ( STARTX+130, STARTY+165, 870, 80 , 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA3, ""), 	// 주소
		
		DLG_BUTTON(STARTX,     STARTY+245, 130, 50 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_ADDR2, "상호"),
		DLG_TEXT ( STARTX+130, STARTY+245, 500, 50 , 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA7, ""), 	// 상호 텍스트
		DLG_TEXT ( STARTX+630, STARTY+245, 150, 50 , 0, 0, 0, EDITSTY_BORDER,      WHITE, TXTINCTRLBK, TXT_DATA99, ""), 
		DLG_TEXT ( STARTX+780, STARTY+245, 220, 50 , 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA8, ""), 	// 상호 텍스트2
		DLG_BUTTON(STARTX+780, STARTY+245, 220, 50 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_SMS_STS, ""),
		
		DLG_BUTTON(STARTX,     STARTY+295, 130, 50 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_ADDR4, "기물"),
	 	
		DLG_BUTTON(STARTX+130, STARTY+295, 370, 50 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_MTR_ID_NUM, ""),
		
		DLG_BUTTON(STARTX+500, STARTY+295, 110, 50 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_ADDR5, "HP"),	
		DLG_BUTTON(STARTX+610, STARTY+295, 390, 50 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_TEL, ""),
		
		/**********************************/
		/* 숫자판 & 기타 화면 버튼        */
		/**********************************/
		DLG_TEXT ( STARTX,     STARTY+605, 196, 73 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, TXT_ONE  , "1"),
		DLG_TEXT ( STARTX+196, STARTY+605, 196, 73 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, TXT_TWO  , "2"),
		DLG_TEXT ( STARTX+392, STARTY+605, 196, 73 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, TXT_THREE, "3"),
		DLG_TEXT ( STARTX+588, STARTY+605, 196, 73 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, TXT_NUMDEL , "←"),
		DLG_BUTTON(STARTX+784, STARTY+605, 216, 73 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_FEE, "요금"),
		
		DLG_TEXT ( STARTX,     STARTY+678, 196, 73 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, TXT_FOUR , "4"),
		DLG_TEXT ( STARTX+196, STARTY+678, 196, 73 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, TXT_FIVE , "5"),
		DLG_TEXT ( STARTX+392, STARTY+678, 196, 73 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, TXT_SIX  , "6"),
		DLG_BUTTON(STARTX+588, STARTY+678, 196, 73 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_DELETE, "삭제"),
		DLG_BUTTON(STARTX+784, STARTY+678, 216, 73 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_CALCUL, "계산"),
		
		DLG_TEXT ( STARTX,     STARTY+751, 196, 73 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, TXT_SEVEN, "7"),
		DLG_TEXT ( STARTX+196, STARTY+751, 196, 73 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, TXT_EIGHT, "8"),
		DLG_TEXT ( STARTX+392, STARTY+751, 196, 73 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, TXT_NINE , "9"),
		DLG_BUTTON(STARTX+588, STARTY+751, 196, 148, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, CORAL, CALL_FUNC , "", BID_SAVE, "저장"),
		DLG_BUTTON(STARTX+784, STARTY+751, 216, 73 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_CLIENT, "고객"),
		
		//DLG_BUTTON(STARTX,     STARTY+824, 196, 75 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_PREVPG, "◀"),
		//DLG_TEXT ( STARTX+196, STARTY+824, 196, 75 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, TXT_ZERO , "0"),
		//DLG_BUTTON(STARTX+392, STARTY+824, 196, 75 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_NEXTPG, "▶"),
		
		DLG_TEXT ( STARTX,     STARTY+824, 196, 75 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, TXT_PREVPG , "◀"),
		DLG_TEXT ( STARTX+196, STARTY+824, 196, 75 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, TXT_ZERO , "0"),
		DLG_TEXT ( STARTX+392, STARTY+824, 196, 75 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, TXT_NEXTPG , "▶"),
		
		DLG_BUTTON(STARTX+784, STARTY+824, 216, 75 , 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_MEMO, "메모"),
		
		/**********************************/
		/* 장치 타입에 따라 달라지는 화면 */
		/**********************************/
		DLG_BUTTON(0, 0, 0, 0, 0,  0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_THMONTH, "당월"),
		DLG_TEXT ( 0, 0, 0, 0, 0,  0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA11, "전월"),   	// 전월		
		DLG_TEXT ( 0, 0, 0, 0, 0,  0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA12, "전전월"), 	// 전전월		
		DLG_TEXT ( 0, 0, 0, 0, 0,  0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA13, "교체일"), 	// 교체일
		DLG_TEXT ( 0, 0, 0, 0, 0,  0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA14, ""),  	   	// 교체날짜
		DLG_TEXT ( 0, 0, 0, 0, 0,  0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA15, "지침"),
		DLG_TEXT ( 0, 0, 0, 0, 0,  0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA16, ""),
		DLG_BUTTON(0, 0, 0, 0, 0, 20, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_USEQTY, ""),	
		DLG_BUTTON(0, 0, 0, 0, 0, 20, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_REMOTE, ""),	
		
		DLG_TEXT ( 0, 0, 0, 0, 0,  0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA17, ""),
		DLG_TEXT ( 0, 0, 0, 0, 0,  0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA18, ""),
		DLG_TEXT ( 0, 0, 0, 0, 0,  0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA19, ""),
		DLG_TEXT ( 0, 0, 0, 0, 0,  0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA20, ""),
		DLG_TEXT ( 0, 0, 0, 0, 0,  0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA21, ""),				
		DLG_TEXT ( 0, 0, 0, 0, 0,  0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA22, ""),
		DLG_TEXT ( 0, 0, 0, 0, 0,  0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA23, ""),
		DLG_TEXT ( 0, 0, 0, 0, 0,  0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA24, ""),
		
		DLG_TEXT ( 0, 0, 0, 0, 0,  0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_USEQTY, ""), // 사용량(계량기)
		DLG_EDIT ( 0, 0, 0, 0, 0,  0, EDITSTY_BOLD, EDITSTY_BORDER, TXTFRCOLOR, EDTCTRLBK, EDT_VC, 10,  ""),
		DLG_EDIT ( 0, 0, 0, 0, 0,  0, EDITSTY_BOLD, EDITSTY_BORDER, TXTFRCOLOR, EDTCTRLBK, EDT_VA, 10,  ""),
		DLG_EDIT ( 0, 0, 0, 0, 0,  0, EDITSTY_BOLD, EDITSTY_BORDER, TXTFRCOLOR, EDTCTRLBK, EDT_VM, 10,  ""),
	
		DLG_COMBO( 0, 0, 0, 0, 0,  0, TXTFRCOLOR, TXTINCTRLBK, CALL_FUNC, "", CMB_RESULT, 4),	// 검침코드
	};	
	
	//---------------------------------------------------------------
	//  다이얼로그:상세지침내역
	//---------------------------------------------------------------
	DlgObject	DlgRes_JCHM[] = 
	{
		NORM_DLG ("", "", DLGSTY_HSCROLLBAR|DLGSTY_VSCROLLBAR|DLGSTY_TITLE, 0, MAINBKCOLOR, WHITE, BLUE, TITLE_HEIGHT, 0),
		DLG_ICON(POPTX, POPTY, ICON_TITLE, ""),
		DLG_TEXT(POPTX, POPTY, POPSTWD, POPSTHT, 0, 0, EDITSTY_BORDER, EDITSTY_BOLD, TTLCTRLFR, TTLCTRLBK, TXT_TITLE, "상세 지침 내역"),
		DLG_BUTTON(BTNX_7, P_BTNY, BTNWD_2, BTNHT_2, 0, 0, EDITSTY_BORDER, 0, BTNMENUFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", BID_OK, ""),
		
		DLG_TEXT ( STARTX ,    STARTY-29 , 250, 80, 0,0, 0, EDITSTY_BORDER, TXTTTLFRCOLOR, TXTCTRLBK, TXT_DATA25, "구분"),
		DLG_TEXT ( STARTX+250, STARTY-29 , 250, 80, 0,0, 0, EDITSTY_BORDER, TXTTTLFRCOLOR, TXTCTRLBK, TXT_DATA26, "전월지침"),
		DLG_TEXT ( STARTX+500, STARTY-29 , 250, 80, 0,0, 0, EDITSTY_BORDER, TXTTTLFRCOLOR, TXTCTRLBK, TXT_DATA27, "전전월"),
		DLG_TEXT ( STARTX+750, STARTY-29 , 250, 80, 0,0, 0, EDITSTY_BORDER, TXTTTLFRCOLOR, TXTCTRLBK, TXT_DATA28, "전년동월"),
		
		DLG_TEXT ( STARTX ,    STARTY+51 , 250, 80, 0,0, 0, EDITSTY_BORDER, TXTTTLFRCOLOR, TXTCTRLBK, TXT_DATA29, "지침"),
		DLG_TEXT ( STARTX+250, STARTY+51 , 250, 80, 0,0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA30, ""),
		DLG_TEXT ( STARTX+500, STARTY+51 , 250, 80, 0,0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA31, ""),
		DLG_TEXT ( STARTX+750, STARTY+51 , 250, 80, 0,0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA32, ""),
		DLG_TEXT ( STARTX ,    STARTY+131, 250, 80, 0,0, 0, EDITSTY_BORDER, TXTTTLFRCOLOR, TXTCTRLBK, TXT_DATA33, "사용량"),
		DLG_TEXT ( STARTX+250, STARTY+131, 250, 80, 0,0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA34, ""),
		DLG_TEXT ( STARTX+500, STARTY+131, 250, 80, 0,0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA35, ""),
		DLG_TEXT ( STARTX+750, STARTY+131, 250, 80, 0,0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA36, ""),
		
		DLG_BUTTON(STARTX+650, STARTY+250, 350, 80, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_OK,  "확인"),
	};
	
	//---------------------------------------------------------------
	//  다이얼로그:상세지침내역 - 보정기
	//---------------------------------------------------------------
	DlgObject	DlgRes_BJCHM[] = 
	{
		NORM_DLG ("", "", DLGSTY_HSCROLLBAR|DLGSTY_VSCROLLBAR|DLGSTY_TITLE, 0, MAINBKCOLOR, WHITE, BLUE, TITLE_HEIGHT, 0),
		DLG_ICON(POPTX, POPTY, ICON_TITLE, ""),
		DLG_TEXT(POPTX, POPTY, POPSTWD, POPSTHT, 0, 0, EDITSTY_BORDER, EDITSTY_BOLD, TTLCTRLFR, TTLCTRLBK, TXT_TITLE, "상세 지침 내역-보정기"),
		DLG_BUTTON(BTNX_7, P_BTNY, BTNWD_2, BTNHT_2, 0, 0, EDITSTY_BORDER, 0, BTNMENUFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", BID_OK2, ""),
		
		DLG_TEXT ( STARTX,     STARTY-29 , 250, 90, 0,0, 0, EDITSTY_BORDER, TXTTTLFRCOLOR, TXTCTRLBK,   TXT_DATA37, "구분"),
		DLG_TEXT ( STARTX+250, STARTY-29 , 250, 90, 0,0, 0, EDITSTY_BORDER, TXTTTLFRCOLOR, TXTCTRLBK,   TXT_DATA38, "전월지침"),
		DLG_TEXT ( STARTX+500, STARTY-29 , 250, 90, 0,0, 0, EDITSTY_BORDER, TXTTTLFRCOLOR, TXTCTRLBK,   TXT_DATA39, "전전월"),
		DLG_TEXT ( STARTX+750, STARTY-29 , 250, 90, 0,0, 0, EDITSTY_BORDER, TXTTTLFRCOLOR, TXTCTRLBK,   TXT_DATA40, "전년동월"),
		DLG_TEXT ( STARTX,     STARTY+61 , 250, 90, 0,0, 0, EDITSTY_BORDER, TXTTTLFRCOLOR, TXTCTRLBK,   TXT_DATA41, "VC"),
		DLG_TEXT ( STARTX+250, STARTY+61 , 250, 90, 0,0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA42, ""),
		DLG_TEXT ( STARTX+500, STARTY+61 , 250, 90, 0,0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA43, ""),
		DLG_TEXT ( STARTX+750, STARTY+61 , 250, 90, 0,0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA44, ""),
		DLG_TEXT ( STARTX,     STARTY+151, 250, 90, 0,0, 0, EDITSTY_BORDER, TXTTTLFRCOLOR, TXTCTRLBK,   TXT_DATA45, "VA"),
		DLG_TEXT ( STARTX+250, STARTY+151, 250, 90, 0,0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA46, ""),
		DLG_TEXT ( STARTX+500, STARTY+151, 250, 90, 0,0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA47, ""),
		DLG_TEXT ( STARTX+750, STARTY+151, 250, 90, 0,0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA48, ""),
		DLG_TEXT ( STARTX,     STARTY+241, 250, 90, 0,0, 0, EDITSTY_BORDER, TXTTTLFRCOLOR, TXTCTRLBK,   TXT_DATA49, "VM"),
		DLG_TEXT ( STARTX+250, STARTY+241, 250, 90, 0,0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA50, ""),
		DLG_TEXT ( STARTX+500, STARTY+241, 250, 90, 0,0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA51, ""),
		DLG_TEXT ( STARTX+750, STARTY+241, 250, 90, 0,0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA52, ""),
		DLG_TEXT ( STARTX,     STARTY+331, 250, 90, 0,0, 0, EDITSTY_BORDER, TXTTTLFRCOLOR, TXTCTRLBK,   TXT_DATA53, "사용량"),
		DLG_TEXT ( STARTX+250, STARTY+331, 250, 90, 0,0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA54, ""),
		DLG_TEXT ( STARTX+500, STARTY+331, 250, 90, 0,0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA55, ""),
		DLG_TEXT ( STARTX+750, STARTY+331, 250, 90, 0,0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA56, ""),
		
		DLG_BUTTON(STARTX+650, STARTY+450, 350, 90, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_OK2,  "확인"),
	};
	
	//---------------------------------------------------------------
	//  다이얼로그:상시계수입력
	//---------------------------------------------------------------
	DlgObject	DlgRes_NUM[] = 
	{
		NORM_DLG ("", "", DLGSTY_HSCROLLBAR|DLGSTY_VSCROLLBAR|DLGSTY_TITLE, 0, MAINBKCOLOR, WHITE, BLUE, TITLE_HEIGHT, 0),
		DLG_ICON(POPTX, POPTY, ICON_TITLE, ""),
		DLG_TEXT(POPTX, POPTY, POPSTWD, POPSTHT, 0, 0, EDITSTY_BORDER, EDITSTY_BOLD, TTLCTRLFR, TTLCTRLBK, TXT_TITLE, "상시 계수 입력"),
		DLG_BUTTON(BTNX_7, P_BTNY, BTNWD_2, BTNHT_2, 0, 0, EDITSTY_BORDER, 0, BTNMENUFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", BID_CLOSE2, ""),
		
		DLG_TEXT ( STARTX,      STARTY  -29,  300, 70, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTTTLFRCOLOR, TXTCTRLBK, TXT_DATA57, "상시온도"),	
		DLG_EDIT ( STARTX +300, STARTY  -29,  550, 70, 0, 0, EDITSTY_BOLD, EDITSTY_BORDER, TXTFRCOLOR, EDTCTRLBK, EDT_DATA4, 7,  ""),	
		DLG_TEXT ( STARTX +850, STARTY  -29,  150, 70, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTTTLFRCOLOR, TXTCTRLBK, TXT_DATA58, "℃"),
			
		DLG_TEXT ( STARTX,      STARTY  +41,  300, 70, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTTTLFRCOLOR, TXTCTRLBK, TXT_DATA59, "상시압력"),
		DLG_EDIT ( STARTX +300, STARTY  +41,  550, 70, 0, 0, EDITSTY_BOLD, EDITSTY_BORDER, TXTFRCOLOR, EDTCTRLBK, EDT_DATA5, 7,  ""),
		DLG_TEXT ( STARTX +850, STARTY  +41,  150, 70, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTTTLFRCOLOR, TXTCTRLBK, TXT_DATA60, "Kpa"),
		
		DLG_TEXT ( STARTX,      STARTY +111,  300, 70, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTTTLFRCOLOR, TXTCTRLBK, TXT_DATA61, "보정계수"),
		DLG_EDIT ( STARTX +300, STARTY +111,  700, 70, 0, 0, EDITSTY_BOLD, EDITSTY_BORDER, TXTFRCOLOR, EDTCTRLBK, EDT_DATA6, 7,  ""),
		
		DLG_LINE ( STARTX,      STARTY +185, 1000, STARTY +185, DARKSLATEBLUE, 10, LINE_DATA_1),
		
		DLG_BUTTON(STARTX,      STARTY +190,  330, 80, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, TXTFRCOLOR, YELLOW, CALL_FUNC , "", BID_PHOTO_VC,  "VC사진"),
		DLG_BUTTON(STARTX +330, STARTY +190,  340, 80, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, TXTFRCOLOR, YELLOW, CALL_FUNC , "", BID_PHOTO_VA,  "VA사진"),
		DLG_BUTTON(STARTX +670, STARTY +190,  330, 80, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, TXTFRCOLOR, YELLOW, CALL_FUNC , "", BID_PHOTO_VM,  "VM사진"),
		
		DLG_LINE ( STARTX,      STARTY +274, 1000, STARTY +274, DARKSLATEBLUE, 10, LINE_DATA_2),
	
		DLG_BUTTON(STARTX,      STARTY +279,  500, 80, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_CLOSE2,  "닫기"),
		DLG_BUTTON(STARTX +500, STARTY +279,  500, 80, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_SAVE2,  "저장"),
	};
	
	//---------------------------------------------------------------
	//  다이얼로그:사용량 이상세대
	//---------------------------------------------------------------
	DlgObject	DlgRes_USE[] = 
	{
		NORM_DLG ("", "", DLGSTY_HSCROLLBAR|DLGSTY_VSCROLLBAR|DLGSTY_TITLE, 0, MAINBKCOLOR, WHITE, BLUE, TITLE_HEIGHT, 0),
		DLG_ICON(POPTX, POPTY, ICON_TITLE, ""),
		DLG_TEXT(POPTX, POPTY, POPSTWD, POPSTHT, 0, 0, EDITSTY_BORDER, EDITSTY_BOLD, TTLCTRLFR, TTLCTRLBK, TXT_TITLE, "사용량 이상세대"),
		DLG_BUTTON(BTNX_7, P_BTNY, BTNWD_2, BTNHT_2, 0, 0, EDITSTY_BORDER, 0, BTNMENUFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", BID_SAVE3, ""),
		
		DLG_TEXT ( STARTX,     STARTY-29 , 300, 90, 0, 0, 0, EDITSTY_BORDER, TXTTTLFRCOLOR, TXTCTRLBK, TXT_DATA62, "선택"),
		DLG_TEXT ( STARTX+300, STARTY-29 , 700, 90, 0, 0, 0, EDITSTY_BORDER, TXTTTLFRCOLOR, TXTCTRLBK, TXT_DATA63, "구분"),
		
		DLG_BUTTON(STARTX,     STARTY+61 , 300, 90, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNCHKFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", BID_BOX1,  CHKOFF),
		DLG_TEXT ( STARTX+300, STARTY+61 , 700, 90, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA65, "정상(사용량 감소)"),
		
		DLG_BUTTON(STARTX, 	   STARTY+151, 300, 90, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNCHKFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", BID_BOX2,  CHKOFF),
		DLG_TEXT ( STARTX+300, STARTY+151, 700, 90, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA67, "비정상(계량기 이상)"),
		
		DLG_BUTTON(STARTX,     STARTY+241, 300, 90, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNCHKFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", BID_BOX3,  CHKOFF),
		DLG_TEXT ( STARTX+300, STARTY+241, 700, 90, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA69, "비정상(보정장치 이상)"),
		
		DLG_BUTTON(STARTX,     STARTY+331, 300, 90, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNCHKFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", BID_BOX4,  CHKOFF),
		DLG_TEXT ( STARTX+300, STARTY+331, 700, 90, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, TXTINCTRLBK, TXT_DATA71, "비정상(기타)"),
		
		DLG_BUTTON(STARTX+650, STARTY+480, 350, 90, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_SAVE3,  "저장"),
	};
	
	//---------------------------------------------------------------
	//  다이얼로그:보정기 삭제
	//---------------------------------------------------------------
	DlgObject	DlgRes_COMPENSREMOVE[] = 
	{
		NORM_DLG ("", "", DLGSTY_HSCROLLBAR|DLGSTY_VSCROLLBAR|DLGSTY_TITLE, 0, MAINBKCOLOR, WHITE, BLUE, TITLE_HEIGHT, 0),
		DLG_ICON(POPTX, POPTY, ICON_TITLE, ""),
		DLG_TEXT(POPTX, POPTY, POPSTWD, POPSTHT, 0, 0, EDITSTY_BORDER, EDITSTY_BOLD, TTLCTRLFR, TTLCTRLBK, TXT_TITLE, "보정장치 고장 확인서"),
		DLG_BUTTON(BTNX_7, P_BTNY, BTNWD_2, BTNHT_2, 0, 0, EDITSTY_BORDER, 0, BTNMENUFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", BID_COMPENS_CLOSE, ""),
		
		DLG_TEXT ( STARTX,     STARTY- 29, 1000, 652, 0, 0, 0, EDITSTY_BORDER|EDITSTY_BOLD, TXTFRCOLOR, EDTCTRLBK, TXT_COMPENS_MAIN, ""),
		
		DLG_TEXT ( STARTX,     STARTY+623,  330,  90, 0, 0, 0, EDITSTY_BORDER, TXTTTLFRCOLOR, TXTCTRLBK, TXT_COMPENS_CONF_NM, "확인자"),
		
		DLG_BUTTON(STARTX+330, STARTY+623,  670,  90, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLMNBKCOLOR, CALL_FUNC , "", BID_COMPENS_CONF_NM, ""),
		DLG_TEXT ( STARTX+330, STARTY+623,  670,  90, 0, 0, 0, EDITSTY_BORDER, TXTFRCOLOR, EDTCTRLBK, EDT_COMPENS_CONF_NM, ""),
		
		DLG_BUTTON(STARTX, 	   STARTY+713, 1000,  90, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_COMPENS_SIGN, "서명"),
		
		DLG_LINE ( STARTX,     STARTY+806, 1000, STARTY+806, DARKSLATEBLUE, 8, LINE_DATA1),
		
		DLG_BUTTON(STARTX,     STARTY+810,  500,  90, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_COMPENS_CLOSE, "취소"),
		DLG_BUTTON(STARTX+500, STARTY+810,  500,  90, 0, 0, BUTSTY_BOLD, BUTSTY_BORDER, BTNMENUFRCOLOR, BTNCTRLBKCOLOR, CALL_FUNC , "", BID_COMPENS_OK,  "저장"),
	};
	
	//---------------------------------------------------------------
	//	main 
	//---------------------------------------------------------------
	bool main(quad MsgType, quad wParam, quad lParam)
	{
		EVENT_HANDLER (MsgType, wParam, lParam);		
		return TRUE;
	}
	
	//---------------------------------------------------------------
	// OnInit Function
	//---------------------------------------------------------------	
	void OnInit(char bFirst)
	{
		long i;
		char szPhoneNum[32];
		char szPhoneNum1[5];
		char szPhoneNum2[5];
		char szPhoneNum3[5];
		char szToday[20];
		long lEndDate, lToDate;
		
		m_bFirst = bFirst;
		
		switch (bFirst)
		{
			/*************************/
			/* 검침등록              */
			/*************************/
			case INIT_MAIN:
				
				CREATE_GLOBAL_BUTTON (SysButRes_MAIN);
				CREATE_DIALOG_OBJECT (DlgRes, SIZEOF(DlgRes));
					
				SetBtnImg();
				SetTotCnt();
				
				g_nGmType = 1; // 정상검침, 재검 구분 
				
				for ( i = 0 ;  RE_GM_CODE[i].Str[0] != 0 ; i++)
				{
					ListCtrl_AddItem (Get_hDlgCtrlByID(CMB_RESULT+2), RE_GM_CODE[i].Str, 0, ICON_NONE);
				}
				
				// 처음 화면 들어왔을시 한번만 실행.
				if( g_lDataflag == 0 )
				{
					g_nSmsSndFlag = 0;
					SetData();
					SetStyle();
					REDRAW();
				}
				else
				{
					// SetData();
					SetStyle();
					REDRAW();
					
					//자가검침 여부 체크
					if( Str_Cmp(stGm.SELF_GMTR_YN, "Y") == 0 )
					{
						lToDate = Time_GetDate();
						lEndDate = Str_AtoI( stGm.SELF_GMTR_END_YMD );
						
						Mem_Set( (byte*)szToday, 0x00, sizeof(szToday) );
						Str_ItoA(Time_GetDate(), szToday, 10); //0502
						
						// 자가검침 세대면서 검침관리상태가 대상제외인경우 입력 불가
						if (Str_Cmp(stGm.MTR_LOC_FLAG, "20") == 0 && lEndDate > 0 && (lEndDate > lToDate))
						{
							MessageBoxEx(CONFIRM_OK, "자가검침 기간이지만 계량기가 외부에 있어 PDA검침도 가능합니다.");

							DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), TRUE );
							DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), FALSE );
							
							DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), TRUE );
							DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), FALSE );
							
							DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
							DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
							
							DlgCtrl_SetEnable( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), TRUE);
							DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), FALSE );
							
							Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);	
						}
						else if( lEndDate > 0  && ( lToDate > lEndDate ) && Str_Cmp(stGm.GMTR_MANAGE_STS, "70") != 0 )
						{
							MessageBoxEx(CONFIRM_OK, "자가검침세대이지만\n등록기간이 경과되어\nPDA검침이 가능합니다.");
							
							DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), TRUE );
							DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), FALSE );
							
							DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), TRUE );
							DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), FALSE );
							
							DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
							DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
							
							DlgCtrl_SetEnable( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), TRUE);
							DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), FALSE );	
						}
						else if(Str_Cmp(stGm.MTR_LOC_FLAG, "10") == 0  && Str_Cmp(stGm.GMTR_JOB_YMD_END,szToday) == 0 )
						{
							MessageBoxEx(CONFIRM_OK, "자가검침 기간이지만 \n 계량기가 내부에 있고 \n 금일 검침종료일이라 PDA검침이 가능합니다.");
							// 20190129_마감일변경 개선
							DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), TRUE );
							DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), FALSE );
							
							DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), TRUE );
							DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), FALSE );
							
							DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
							DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
							
							DlgCtrl_SetEnable( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), TRUE);
							DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), FALSE );
							
							Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
						}
						else
						{
							MessageBoxEx(CONFIRM_OK, "자가검침세대는 입력불가합니다 _INIT_.");
							
							DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), FALSE );
							DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), TRUE );
							
							DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), FALSE );
							DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), TRUE );
							
							DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
							DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
							
							DlgCtrl_SetEnable( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), FALSE);
							DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), TRUE );
							
							if( Str_Cmp(stGm.GMTR_MANAGE_STS, "70") == 0 && Str_Cmp(stGm.DEADLINE_CHG_YN, "Y") == 0 && Str_Cmp(stGm.SELF_GMTR_YN, "Y") == 0)
							{
								EditCtrl_SetStr( Get_hDlgCtrlByID(CMB_RESULT), "마감변경" );
								MessageBoxEx(CONFIRM_OK, "[마감일변경세대]는\n입력불가합니다.");
							}
							else
							{
								EditCtrl_SetStr( Get_hDlgCtrlByID(CMB_RESULT), "자가검침" );
								MessageBoxEx(CONFIRM_OK, "[자가검침세대]는\n입력불가합니다.");
							}	
						}
					}
					else if( Str_Cmp(stGm.REMOTE_GMTR_YN, "Y") == 0 )
					{
						DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(BID_REMOTE), TRUE);
						ButCtrl_SetText(Get_hDlgCtrlByID(BID_REMOTE), "원격지침");
						BUTSETRANGE(Get_hDlgCtrlByID(BID_REMOTE),	STARTX+500, STARTY+345,  785, 510);	
					}
				}

				if( Str_Cmp(stGm.SMS_GMTR_MAN_YN, "Y") == 0 || Str_Cmp(stGm.BEFO_GMTR_SMS_YN, "Y") == 0 )
				{
					DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(BID_SMS_STS), TRUE);
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_SMS_STS), RED);
					m_lSmsStsFlag = 0;
					Rcv_SmsSts();
				}
				else
				{
					ButCtrl_SetText(Get_hDlgCtrlByID(BID_SMS_STS), "");
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_SMS_STS), BTNMENUFRCOLOR);
					DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(BID_SMS_STS), FALSE);
					
					if( Str_Cmp(stGm.SELF_GMTR_YN, "Y") == 0 )
					{
						Rcv_self_select();
					}
				}
				
				ON_DRAW();
				
				// 사용량 이상세대 설정 후 검침저장
				if( m_lChk > 0 || g_nSmsSndFlag == 1 )
				{
					OnButton(BID_SAVE);
				}
				
				break;
			
			/*************************/
			/* 상세지침내역          */
			/*************************/
			case INIT_JCHM:
				
				CREATE_DIALOG_OBJECT (DlgRes_JCHM, SIZEOF(DlgRes_JCHM));
				
				SetBtnImg();
				JCHM_DRAW();
				
				break;
			
			/*************************/
			/* 상세지침내역 - 보정기 */
			/*************************/
			case INIT_BJCHM:
				
				CREATE_DIALOG_OBJECT (DlgRes_BJCHM, SIZEOF(DlgRes_BJCHM));	
				
				SetBtnImg();
				JCHM_DRAW();
				
				break;
			
			/*************************/
			/* 상시계수입력          */
			/*************************/
			case INIT_NUM:
				
				CREATE_DIALOG_OBJECT (DlgRes_NUM, SIZEOF(DlgRes_NUM));
					
				SetBtnImg();
				NUM_DRAW();
				
				break;
			
			/*************************/
			/* 사용량 이상세대       */
			/*************************/
			case INIT_USE:
				
				CREATE_DIALOG_OBJECT (DlgRes_USE, SIZEOF(DlgRes_USE));
				
				SetBtnImg();
				m_lChk = 0;
				
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA62), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA63), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA65), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA67), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA69), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA71), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
				
				break;
				
			/*************************/
			/* 보정기 고장 서명      */
			/*************************/
			case INIT_COMPENSREMOVE:
			
				CREATE_DIALOG_OBJECT (DlgRes_COMPENSREMOVE, SIZEOF(DlgRes_COMPENSREMOVE));
				
				SetBtnImg();
				COMPENSREMOVE_DRAW();
				
				break;
		}
	}
	
	/*=======================================================================================
	함수명 : OnKey
	기  능 : 키설정
	Param  : 
	Return :
	========================================================================================*/
	void OnKey(long nKey)
	{
		long i;
		char szMtr_Code[10];
		
		if( m_bFirst == INIT_MAIN)
		{
			// 백스페이스 키 사용시 사용량 계산
			if( nKey == 5  && m_lUserData == 10 )
			{
				if( Str_AtoI(EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC))) > 0 )
				{
					Mem_Set( (byte*)stGm.INDI_SET_VC, 0x00, sizeof(stGm.INDI_SET_VC));
					Str_Cpy( stGm.INDI_SET_VC, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
					Cal_UseQty(stGm.INDI_SET_VC);
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), m_szIndiQty);
				}
				else if( nKey != 10 )
				{
					Mem_Set( (byte*)m_szIndiQty, 0x00, sizeof(m_szIndiQty));
					Str_Cpy(m_szIndiQty, "0");
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), "0");
				}
			}
			// 나머지 키 사용시
			else
			{
				if( Str_AtoI(EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC))) > 0 )
				{
					Mem_Set( (byte*)stGm.INDI_SET_VC, 0x00, sizeof(stGm.INDI_SET_VC));
					Mem_Set( (byte*)szMtr_Code, 0x00, sizeof(szMtr_Code));
					Str_Cpy( stGm.INDI_SET_VC, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
					
					i = SearchStr( EditCtrl_GetStr(Get_hDlgCtrlByID(CMB_RESULT)), RE_GM_CODE );
					
					if(i >= 0)
					{
						Str_Cpy(szMtr_Code, RE_GM_CODE[i].Code);
					}

					if( nKey != 10 )
					{
						if( Str_Cmp(szMtr_Code, "3") == 0 )
						{
							Mem_Set( (byte*)m_szIndiQty, 0x00, sizeof(m_szIndiQty));
							EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), "");
						}
						else
						{
							Cal_UseQty( stGm.INDI_SET_VC );
							EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), m_szIndiQty);
						}
					}
				}
				else if( nKey != 10 )
				{
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), "0");
					Str_Cpy(m_szIndiQty, "0");
				}
			}
			
			ON_DRAW();
		}
	}
	
	/*=======================================================================================
	함수명 : OnChar
	기  능 : 키보드 설정
	Param  : 
	Return : 
	========================================================================================*/
	void OnChar(long nChar)
	{
		long i;
		long nLen = 0;
		char szMtr_Code[13];
		char strMsg[100];
		
		if( m_bFirst == INIT_MAIN )
		{
			// 숫자만 입력 가능
			if( (nChar < 48 ||  nChar > 57) )
			{
				MessageBoxEx (ERROR_OK, "숫자만 입력가능합니다.");
				EditCtrl_SetStr(Get_hDlgCtrlByIndex(m_lEditCtrlIndex), "");
				
				if( m_lUserData == 10 )
				{
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), "");
					Str_Cpy(m_szIndiQty, "");
				}
				else
				{
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), "");
					Str_Cpy(m_szIndiQty, "");
				}
				
				ON_DRAW();
				return;
			}
		
			//입력 시 사용량 자동 계산
			if( Get_iDlgCtrlByID(EDT_VC) == m_lEditCtrlIndex )
			{
				//2017.01.25 황영자 과장님 요청, 계량기 지침VC 자릿수 체크, szMtr_digit_cnt
				nLen = g_GetUtf8Size(EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));

				if( nLen > Str_AtoI(stGm.MTR_DIGIT_CNT) )
				{
					Mem_Set((byte *)strMsg, 0x00, sizeof(strMsg));

					Str_Cpy(strMsg, "계량기 지침 자릿수를 초과하였습니다.\n ");
					Str_Cat(strMsg, "\n계량기번호 : ");
					Str_Cat(strMsg, stGm.MTR_NUM);
					Str_Cat(strMsg, "\n지침 최대 자릿수 : ");
					Str_Cat(strMsg, stGm.MTR_DIGIT_CNT);;
					
					MessageBoxEx(ERROR_OK, strMsg);
					// 넘어가면 마지막 char 삭제
					ON_KEY( 5 );
					//return;
				}
				
				if( m_lUserData == 10 )
				{
					Mem_Set( (byte*)stGm.INDI_SET_VC, 0x00, sizeof(stGm.INDI_SET_VC));
					Str_Cpy( stGm.INDI_SET_VC, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
					Cal_UseQty( stGm.INDI_SET_VC );
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), m_szIndiQty);
					
					/* 2018.01.29 황영자 과장님 요청 : 사용량 체크 로직 제외
					if( m_szMtr_Code[0] != '6' )
					{
						if( Str_AtoI(m_szIndiQty) > Str_AtoI(stGm.MAX_GMTR_QTY) )
						{
							Mem_Set((byte *)strMsg, 0x00, sizeof(strMsg));
							
							Str_Cpy(strMsg, "최대 사용량을 초과하였습니다.\n ");
							Str_Cat(strMsg, "\n현재 사용량 : ");
							Str_Cat(strMsg, m_szIndiQty);
							Str_Cat(strMsg, "\n최대 사용량 : ");
							Str_Cat(strMsg, stGm.MAX_GMTR_QTY);
							
							MessageBoxEx(ERROR_OK, strMsg);

							ON_DRAW();
							return;
						}
					}
					*/
				}
				else
				{
					Mem_Set( (byte*)szMtr_Code, 0x00, sizeof(szMtr_Code));
					Mem_Set( (byte*)stGm.INDI_SET_VC, 0x00, sizeof(stGm.INDI_SET_VC));
					
					Str_Cpy( stGm.INDI_SET_VC, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
					
					i = SearchStr( EditCtrl_GetStr(Get_hDlgCtrlByID(CMB_RESULT)), RE_GM_CODE );
					
					if (i == -1)
					{
						Str_Cpy(m_szMtr_Code, RE_GM_CODE[0].Code);
					}
					else
					{
						Str_Cpy(m_szMtr_Code, RE_GM_CODE[i].Code);
					}

					if( m_szMtr_Code[0] == '3' )
					{
						Mem_Set( (byte*)m_szIndiQty, 0x00, sizeof(m_szIndiQty));
						EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), "");
					}
					else
					{
						Cal_UseQty( stGm.INDI_SET_VC );
						EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), m_szIndiQty);
						
						/* 2018.01.29 황영자 과장님 요청 : 사용량 체크 로직 제외
						if( Str_AtoI(m_szIndiQty) > Str_AtoI(stGm.MAX_GMTR_QTY) )
						{
							Mem_Set((byte *)strMsg, 0x00, sizeof(strMsg));
							
							Str_Cpy(strMsg, "최대 사용량을 초과하였습니다.\n ");
							Str_Cat(strMsg, "\n현재 사용량 : ");
							Str_Cat(strMsg, m_szIndiQty);
							Str_Cat(strMsg, "\n최대 사용량 : ");
							Str_Cat(strMsg, stGm.MAX_GMTR_QTY);
							
							MessageBoxEx(CONFIRM_OK, strMsg);

							ON_DRAW();
							return;
						}
						*/
					}
				}
			}

			ON_DRAW();
		}
	}
	
	/*=======================================================================================
	함수명 : OnPointing
	기  능 : 키 누름
	Param  : 
	Return : 
	========================================================================================*/
	void OnPointing(long nAction, long X, long Y)
	{
		long lActiveIndex = -1;

		//EDITCTRL에 ACTIVE시에 CTRLINDEX를 저장
		//키보드 BUTTONCTRL이 ACTIVE시에도 EDITCTRL에 커서를 두기위해서 INDEX를 저장
		lActiveIndex = Dialog_GetActiveCtrlIndex(this->m_hDlg);	

		if( m_bFirst == INIT_MAIN )
		{
			if( 10 == m_lUserData )
			{
				if( Get_iDlgCtrlByID(EDT_VC) == lActiveIndex )
				{
					m_lEditCtrlIndex = lActiveIndex;
				}
			}
			else if( 20 == m_lUserData )
			{
				if( Get_iDlgCtrlByID(EDT_VM) == lActiveIndex )
				{
					m_lEditCtrlIndex = lActiveIndex;
				}
				else if( Get_iDlgCtrlByID(EDT_VA) == lActiveIndex )
				{
					m_lEditCtrlIndex = lActiveIndex;
				}
				else if( Get_iDlgCtrlByID(EDT_VC) == lActiveIndex )
				{
					m_lEditCtrlIndex = lActiveIndex;
				}
			}
			else
			{
				if( Get_iDlgCtrlByID(EDT_VM) == lActiveIndex )
				{
					m_lEditCtrlIndex = lActiveIndex;
				}
				else if( Get_iDlgCtrlByID(EDT_VC) == lActiveIndex )
				{
					m_lEditCtrlIndex = lActiveIndex;
				}
			}
			
			if( POINTING_DOWN == nAction )
			{
				if( X > DMS_X(STARTX) && X < DMS_X(STARTX+196) && Y > DMS_Y(STARTY+605) && Y < DMS_Y(STARTY+678)  )
				{
					ON_CHAR( '1' );
					VM_PlaySound("1");
				}
				else if( X > DMS_X(STARTX+196) && X < DMS_X(STARTX+392) && Y > DMS_Y(STARTY+605) && Y < DMS_Y(STARTY+678) )
				{
					ON_CHAR( '2' );
					VM_PlaySound("2");
				}
				else if( X > DMS_X(STARTX+392) && X < DMS_X(STARTX+588) && Y > DMS_Y(STARTY+605) && Y < DMS_Y(STARTY+678) )
				{
					ON_CHAR( '3' );
					VM_PlaySound("3");
				}
				else if( X > DMS_X(STARTX) && X < DMS_X(STARTX+196) && Y > DMS_Y(STARTY+678) && Y < DMS_Y(STARTY+751) )
				{
					ON_CHAR( '4' );
					VM_PlaySound("4");
				}
				else if( X > DMS_X(STARTX+196) && X < DMS_X(STARTX+392) && Y > DMS_Y(STARTY+678) && Y < DMS_Y(STARTY+751) )
				{
					ON_CHAR( '5' );
					VM_PlaySound("5");
				}
				else if( X > DMS_X(STARTX+392) && X < DMS_X(STARTX+588) && Y > DMS_Y(STARTY+678) && Y < DMS_Y(STARTY+751) )
				{
					ON_CHAR( '6' );
					VM_PlaySound("6");
				}
				else if( X > DMS_X(STARTX) && X < DMS_X(STARTX+196) && Y > DMS_Y(STARTY+751) && Y < DMS_Y(STARTY+824) )
				{
					ON_CHAR( '7' );
					VM_PlaySound("7");
				}
				else if( X > DMS_X(STARTX+196) && X < DMS_X(STARTX+392) && Y > DMS_Y(STARTY+751) && Y < DMS_Y(STARTY+824) )
				{
					ON_CHAR( '8' );
					VM_PlaySound("8");
				}
				else if( X > DMS_X(STARTX+392) && X < DMS_X(STARTX+588) && Y > DMS_Y(STARTY+751) && Y < DMS_Y(STARTY+824) )
				{
					ON_CHAR( '9' );
					VM_PlaySound("9");
				}
				else if( X > DMS_X(STARTX+196) && X < DMS_X(STARTX+392) && Y > DMS_Y(STARTY+824) && Y < DMS_Y(STARTY+899) )
				{
					ON_CHAR( '0' );
					VM_PlaySound("0");
				}
				else if( X > DMS_X(STARTX+588) && X < DMS_X(STARTX+784) && Y > DMS_Y(STARTY+605) && Y < DMS_Y(STARTY+678) )
				{
					ON_KEY( 5 );
					VM_PlaySound(CLICKSOUND);
				}
				else if( X > DMS_X(STARTX) && X < DMS_X(STARTX+196) && Y > DMS_Y(STARTY+824) && Y < DMS_Y(STARTY+899) )
				{
					Prev_Gm();
					Set_Index();
				}
				else if( X > DMS_X(STARTX+392) && X < DMS_X(STARTX+588) && Y > DMS_Y(STARTY+824) && Y < DMS_Y(STARTY+899) )
				{
					Next_Gm();
					Set_Index();
				}
			}
		}
		else if( m_bFirst == INIT_NUM )
		{
			if( POINTING_UP == nAction )
			{
				if( Get_iDlgCtrlByID(EDT_DATA4) == lActiveIndex ||
				    Get_iDlgCtrlByID(EDT_DATA5) == lActiveIndex ||
				    Get_iDlgCtrlByID(EDT_DATA6) == lActiveIndex )
				{
					ShowSip(TRUE);
					g_Sipflag = 1;
				}
				else
				{
					ShowSip(FALSE);
					g_Sipflag = 0;
				}
				
				ON_DRAW();
			}
		}
		
		return;
	}

	/*=======================================================================================
	함수명 : SetBtnImg
	기  능 : 버튼 이미지
	Param  : 
	Return : 
	========================================================================================*/
	void SetBtnImg(void)
	{
		handle h;
	
		if( m_bFirst == INIT_MAIN )
		{		
			IconCtrl_SetImage(Get_hDlgCtrlByID(ICON_TITLE), 0, g_pImgMainTtl );
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_TITLE), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			
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
		else
		{
			IconCtrl_SetImage(Get_hDlgCtrlByID(ICON_TITLE), 0, g_pImgPopTtlL );	
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_TITLE), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
		}
	}
	
	/*=======================================================================================
	함수명 : OnButton
	기  능 : 버튼 이벤트
	Param  : 
	Return : 
	========================================================================================*/
	void OnButton(long ID)
	{	
		long nchkcnt = 0;
		long i = 0;
		long lRet = 0;
		char szSql[512];
		char szPhoneNum[32];
		char szPhoneNum1[5];
		char szPhoneNum2[5];
		char szPhoneNum3[5];
		char szMsg[200];
		char szTmp[100];
		char strMsg[100];
		
		switch(ID)
		{
			/*************************/
			/* 공통                  */
			/*************************/
			case GID_HOME:
				if( MessageBoxEx (CONFIRM_YESNO, "메인 메뉴로 나가시겠습니까?")  == MB_OK)
				{
					Mem_Set((byte*)stGm.SUBMONITOR_FLAG, 0x00, sizeof(stGm.SUBMONITOR_FLAG));
					Str_Cpy(stGm.SUBMONITOR_FLAG, "0");
					Set_Index();
					
					if( g_nWorkFlag == 101 )
					{
						g_nWorkFlag = 100;
					}
					
					Card_Move("MENU");	
				}
				break;
			
			case GID_MENU:
				if( MessageBoxEx (CONFIRM_YESNO, "검침 메뉴로 나가시겠습니까?")  == MB_OK)
				{
					Mem_Set((byte*)stGm.SUBMONITOR_FLAG, 0x00, sizeof(stGm.SUBMONITOR_FLAG));
					Str_Cpy(stGm.SUBMONITOR_FLAG, "0");
					Set_Index();
					
					if( g_nWorkFlag == 101 )
					{
						g_nWorkFlag = 100;
					}
					
					Card_Move("GM_MENU");
				}
				break;
				
			case GID_KEYBOARD:
				g_SHOW_SIP();
				break;
				
			case GID_SCREEN:
				g_MOVE_DLG(400);
				break;
				
			case GID_CMMNWK:
				// Sos_Key();
				
				if( MessageBoxEx (CONFIRM_YESNO, "SOS 긴급호출을 하시겠습니까?") != MB_OK )
				{
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
				}
				else
				{
					g_Send_SOS(0);
				}
				break;	
							
			case GID_PREV:
				g_nAddrFlag = 0;
				g_nTelFlag = 0;
				g_nNameFlag = 0;
				g_lDataflag = 0;
				
				Mem_Set((byte*)stGm.SUBMONITOR_FLAG, 0x00, sizeof(stGm.SUBMONITOR_FLAG));
				Str_Cpy(stGm.SUBMONITOR_FLAG, "0");
				
				Set_Index();
				
				if( g_nWorkFlag == 103 )
				{
					Card_Move("GM_NOGMLST");
				}
				else if( g_nWorkFlag == 104 )
				{
					Card_Move("GM_ABSNCLST");
				}
				else
				{
					g_nWorkFlag = 100;
					Card_Move("GM_RELST");
				}
				break;
				
			case GID_VMEXIT:
				Set_Index();
				g_Exit();
				break;
			
			/*************************/
			/* 검침등록              */
			/*************************/
			case BID_MENU:
				if( MessageBoxEx (CONFIRM_YESNO, "검침 메뉴로 나가시겠습니까?")  == MB_OK)
				{
					Mem_Set((byte*)stGm.SUBMONITOR_FLAG, 0x00, sizeof(stGm.SUBMONITOR_FLAG));
					Str_Cpy(stGm.SUBMONITOR_FLAG, "0");
					Set_Index();
					
					if( g_nWorkFlag == 101 )
					{
						g_nWorkFlag = 100;
					}
					
					Card_Move("GM_MENU");
				}
				break;
			
			case BID_GMSND:
				if( MessageBoxEx (CONFIRM_YESNO, "송신화면으로 이동하시겠습니까?") != MB_OK)
				{
					break;
				}
				Set_Index();
				Card_Move("GM_RESND");
				break;
				
			case BID_ILLIGAL:
				g_lDataflag = 1;
				SaveInput();
				Set_Index();
				Card_Move("CM_ILLEGAL");
				break;
				
			case BID_SC:
				g_lDataflag = 1;
				SaveInput();
				Set_Index();
				
				Mem_Set((byte*)g_szMTR_NUM, 0x00, sizeof(g_szMTR_NUM));
				Str_Cpy(g_szMTR_NUM, stGm.MTR_NUM);
				
				Mem_Set( (byte*)szSql, 0x00, sizeof( szSql) );
				SPRINT( szSql, " SELECT COUNT(*) FROM NORMAL_DATA WHERE INST_PLACE_NUM = '%s' ", stGm.USAGE_TITLE, 0, 0 );
				g_Sql_RetInt( szSql , &nchkcnt );
				
				if( nchkcnt > 0 )
				{
					if( MessageBoxEx (CONFIRM_YESNO, "점검화면으로 이동하시겠습니까?")  == MB_OK)
					{
						if( safe_chkdata() >= 0 )
						{
							break;
						}
						else
						{
							Card_Move("SC_CONFIRM");	
						}
					}
				}
				else
				{
					if( MessageBoxEx (CONFIRM_YESNO, "당월 안전점검자료가 없습니다.\n해당 세대 점검 데이터를 수신하시겠습니까?") == MB_OK)
					{
						if( safe_chkdata() >= 0 )
						{
							break;
						}
						else
						{
							RCV311324();	
						}
					}
					else
					{
						Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
						Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
					}
				}
				break;
				
			case BID_MESSAGE:
				g_lDataflag = 1;
				g_nSmsFlag = 1;
				
				Mem_Set((byte*)g_szCntSql, 0x00, sizeof(g_szCntSql));
				Str_Cpy(g_szCntSql, EditCtrl_GetStr(Get_hDlgCtrlByID(TXT_DATA3)));	//전화번호 변경 > 주소 출력
				
				SaveInput();
				
				Card_Move("GM_SMSSND");
				break;
				
			case BID_SILSA:
				if( Str_Cmp(stGm.SEND_YN, "Y") == 0 )
				{
					MessageBoxEx(CONFIRM_OK, "이미 송신한 자료입니다.");
				}
				else if( Str_Cmp(stGm.INSP_YN, "Y") != 0 )
				{
					MessageBoxEx(CONFIRM_OK, "실사 대상이 아닙니다.");
				}
				else if( Str_Cmp(stGm.INSP_YN, "Y") == 0 && Str_Cmp(stGm.SEND_YN, "S") == 0 &&
				       ( Str_Cmp(stGm.MTR_WORK_CODE, "1") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "3") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "A") == 0 ||
				         Str_Cmp(stGm.MTR_WORK_CODE, "B") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "C") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "D") == 0 ||
				         Str_Cmp(stGm.MTR_WORK_CODE, "5") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "6") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "7") == 0 ) )
				{
					//정상,교체,미입주,미사용,없음,미기타,순회,고장,해가 : 실사 진행
					g_lDataflag = 1;
					SaveInput();
					Set_Index();
					Card_Move("GM_SILSA");
				}
				break;
				
			case BID_SMS_STS:
				if( Str_Cmp(stGm.GMTR_SEND_STS, "60") == 0 ||
				    Str_Cmp(stGm.GMTR_SEND_STS, "70") == 0 ||
				    Str_Cmp(stGm.GMTR_SEND_STS, "80") == 0 )
				{
					g_lDataflag = 1;
					g_nSmsFlag = 1;
					SaveInput();
					Set_Index();
					Card_Move("GM_SMS_VIEW");
				}
				break;
				
			case BID_NUM:
				g_lDataflag = 1;
				SaveInput();

				ON_EXIT();
				OnInit(INIT_NUM);
				
				break;
				
			case BID_ADDR1:
				g_lDataflag = 1;
				
				SaveInput();
				
				if( g_nAddrFlag == 0)
				{
					g_nAddrFlag = 1;
				}
				else
				{
					g_nAddrFlag = 0;
				}

				REDRAW();
				
				break;
				
			case BID_ADDR2:
				g_lDataflag = 1;
				
				SaveInput();

				if( g_nNameFlag == 0)
				{
					g_nNameFlag = 1;
				}
				else
				{
					g_nNameFlag = 0;
				}
				
				REDRAW();
				
				break;
				
			case BID_ADDR4:
				g_lDataflag = 1;
				SaveInput();
				Set_Index();
				
				REDRAW();
				
				Card_Move("GM_MTRINFO");
					
				break;
				
			case BID_ADDR5:
				g_lDataflag = 1;
				
				SaveInput();

				if( g_nTelFlag == 0)
				{
					g_nTelFlag = 1;
				}
				else
				{
					g_nTelFlag = 0;
				}
				
				REDRAW();
				
				break;
				
			case BID_TEL:
				Mem_Set( (byte*) szMsg, 0x00, sizeof( szMsg) );
				if( g_nTelFlag == 0 )
				{
					SPRINT(szMsg, "%s 고객님께\n전화하시겠습니까?\n(HP : %s)", stGm.CUST_NM,m_szPhone,0);	
				}
				else
				{
					SPRINT(szMsg, "%s 고객님께\n전화하시겠습니까?\n(TEL : %s)", stGm.CUST_NM,m_szPhone,0);
				}
				
				if( MessageBoxEx(CONFIRM_YESNO, szMsg) == MB_OK)
				{
					Call_Tel();
				}
				
				break;
				
			case BID_USEQTY:
				if( MessageBoxEx (CONFIRM_YESNO, "사용량 추이 화면으로\n이동하시겠습니까?") != MB_OK )
				{
					break;
				}
				
				g_lDataflag = 1;
				SaveInput();
				
				Card_Move("GM_USEQTY");
				
				break;
				
			case BID_THMONTH:
				g_lDataflag = 1;
				
				SaveInput();
				
				if(m_lUserData == 10 || m_lUserData == 40 || m_lUserData == 41)
				{
					ON_EXIT();
					OnInit(INIT_JCHM);
				}
				else
				{
					ON_EXIT();
					OnInit(INIT_BJCHM);
				}
				
				break;
				
			case BID_PREVPG:
				Prev_Gm();
				Set_Index();
				
				break;
				
			case BID_NEXTPG:
				Next_Gm();
				Set_Index();
				
				break;
				
			case BID_DELETE:
				if( (stGm.SEND_YN[0] == 'S' || stGm.SEND_YN[0] == 'I') || Str_Cmp(stGm.MTR_WORK_CODE, "L") == 0 )
				{
					if( MessageBoxTitle(TITLE_ERROR_YESNO, "검침취소", "저장한 지침을 취소 하시겠습니까?") == MB_OK )
					{
						if( Str_Cmp(stGm.SMS_GMTR_MAN_YN, "Y") == 0 && Str_Cmp(stGm.MTR_WORK_CODE, "L") == 0 )
						{
							//m_lSmsStsFlag = 0 문자검침 대상 상태 표시, = 1 문자대상 -> 업무 정상 등록 시 상태, = 2 검침취소(삭제) 시 상태
							m_lSmsStsFlag = 2;
							Rcv_SmsSts();
						}
						else
						{
							Del_Gm();
							SetData();
							SetStyle();
							REDRAW();
						}
					}
				}
				else 
				{
					if( 10 == m_lUserData )
					{
						if( Get_iDlgCtrlByID(EDT_VC) == m_lEditCtrlIndex )
						{
							EditCtrl_SetStr( Get_hDlgCtrlByID(EDT_VC), "" );
							EditCtrl_SetStr( Get_hDlgCtrlByID(TXT_USEQTY), "" );
						}
					}
					else if( 20 == m_lUserData )
					{
						if( Get_iDlgCtrlByID(EDT_VM) == m_lEditCtrlIndex )
						{
							EditCtrl_SetStr( Get_hDlgCtrlByID(EDT_VM), "" );
						}
						else if( Get_iDlgCtrlByID(EDT_VA) == m_lEditCtrlIndex )
						{
							EditCtrl_SetStr( Get_hDlgCtrlByID(EDT_VA), "" );
						}
						else if( Get_iDlgCtrlByID(EDT_VC) == m_lEditCtrlIndex )
						{
							EditCtrl_SetStr( Get_hDlgCtrlByID(EDT_VC), "" );
							EditCtrl_SetStr( Get_hDlgCtrlByID(TXT_DATA13), "" );
						}
					}
					else
					{
						if( Get_iDlgCtrlByID(EDT_VM) == m_lEditCtrlIndex )
						{
							EditCtrl_SetStr( Get_hDlgCtrlByID(EDT_VM), "" );
						}
						else if( Get_iDlgCtrlByID(EDT_VC) == m_lEditCtrlIndex )
						{
							EditCtrl_SetStr( Get_hDlgCtrlByID(EDT_VC), "" );
							EditCtrl_SetStr( Get_hDlgCtrlByID(TXT_DATA13), "" );
						}
					}
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
				}
				
				ON_DRAW();
				
				break;
				
			case BID_SAVE:
				SaveInput();
				
				if( Str_Cmp(g_szIndi_MtrCode, "L:문자발송") == 0 && g_nSmsSndFlag == 0 )
				{
					if( Str_Cmp(stGm.SMS_GMTR_MAN_YN, "Y") != 0 )
					{
						m_lSmsStsFlag = 3;
						Rcv_Many();
					}
					else
					{
						if( Str_Cmp(stGm.GMTR_SEND_FLAG, "120") == 0 || Str_Cmp(stGm.SEND_TYPE, "30") == 0 )
						{
							m_lSmsStsFlag = 3;
							Rcv_Many();
						}
						else
						{
							MessageBoxEx (CONFIRM_OK, "이미 문자검침대상입니다.");
						}

						break;
					}
				}
				else if( g_nSmsSndFlag == 1 )
				{
					//메세지 -> 개별메세지 송신 의 경우에 데이터 저장
					Mem_Set((byte *)stGm.INDI_SET_VM, 0x00, sizeof(stGm.INDI_SET_VM));
					Mem_Set((byte *)stGm.INDI_SET_VA, 0x00, sizeof(stGm.INDI_SET_VA));
					Mem_Set((byte *)stGm.INDI_SET_VC, 0x00, sizeof(stGm.INDI_SET_VC));
					Mem_Set((byte *)stGm.INDI_QTY, 0x00, sizeof(stGm.INDI_QTY));
					Mem_Set((byte *)stGm.INDI_DATE, 0x00, sizeof(stGm.INDI_DATE));
					Mem_Set((byte *)szSql, 0x00, sizeof(szSql));
					Mem_Set((byte *)szMsg, 0x00, sizeof(szMsg));
					
					Mem_Set((byte *)stGm.SMS_GMTR_MAN_YN, 0x00, sizeof(stGm.SMS_GMTR_MAN_YN));
					Mem_Set((byte *)m_szMtr_Code, 0x00, sizeof(m_szMtr_Code));
					Mem_Set((byte *)stGm.MTR_WORK_CODE, 0x00, sizeof(stGm.MTR_WORK_CODE));

					//날짜
					Str_ItoA(Time_GetDate(), szSql,10);
					g_Str_TimeType( szMsg, Time_GetTime());
					Str_Cat(szSql, szMsg);
					Str_Cpy(stGm.INDI_DATE, szSql);
					
					Str_Cpy(stGm.SMS_GMTR_MAN_YN, "Y");
					Str_Cpy(m_szMtr_Code, "L");
						
					Str_Cpy(stGm.MTR_WORK_CODE, m_szMtr_Code);		
					Str_Cpy(stGm.INDI_SET_VM, "");			
					Str_Cpy(stGm.INDI_SET_VA, "");			
					Str_Cpy(stGm.INDI_SET_VC, "");			
					Str_Cpy(stGm.INDI_QTY, "");			
					
					if( Save_Gm() > 0 )
					{
						if( 10 == m_lUserData )
						{
							Mem_Set((byte *)g_szMtr_Code, 0x00, sizeof(g_szMtr_Code));
							Str_Cpy(g_szMtr_Code, stGm.MTR_WORK_CODE);
						}
						
						g_nBackFlag++;
						
						if( g_nBackFlag > 99)
						{
							g_Db_Backup();
							g_nBackFlag = 0;
						}
						
						g_nSmsSndFlag = 0;
						m_lLastSave = 1;
						Next_Gm();
						Set_Index();
					}
				}
				else
				{
					if( Gm_ChkRule() > 0 )
					{
						if( Str_Cmp(stGm.SMS_GMTR_MAN_YN, "Y") == 0 && Str_Cmp(stGm.SEND_TYPE, "30") != 0 )
						{
							//문자 대상의 경우 -> 문자 예약취소, 문자대상 삭제 후 기존 업무 저장
							//2017-05-25 Sanghyun Lee
							//문자대상 -> 기존업무로 변경 시
							//발송 이후의 상태값이면 문자대상 취소,삭제 로직은 타지 않고
							//기존 검침업무 저장 로직만 타야함.
							m_lSmsStsFlag = 1;
							Rcv_SmsSts();
						}
						else
						{
							if( Save_Gm() > 0 )
							{
								if( 10 == m_lUserData )
								{
									Str_Cpy(g_szMtr_Code, stGm.MTR_WORK_CODE);
								}
								
								g_nBackFlag++;
								
								if( g_nBackFlag > 99)
								{
									g_Db_Backup();
									g_nBackFlag = 0;
								}
		
								//stGm.INSP_YN -> Y : 실사대상 , stGm.INSP_YN -> N : 실사대상 아님.
								//정상,교체,미입주,미사용,없음,미기타,순회,고장,해가 : 실사 진행
								if( Str_Cmp(stGm.INSP_YN, "Y") == 0 && 
								  ( Str_Cmp(stGm.MTR_WORK_CODE, "1") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "3") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "A") == 0 ||
								    Str_Cmp(stGm.MTR_WORK_CODE, "B") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "C") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "D") == 0 ||
								    Str_Cmp(stGm.MTR_WORK_CODE, "5") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "6") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "7") == 0 ) )
								{
									g_nActIndex++;
									g_lindex = g_SREACHFILE_GetSeq(SREACH_FILE, g_nActIndex);
							
									if( g_nActIndex > m_ltotcnt || g_lindex < 0 )
									{
										if( g_SREACHFILE_GetSeq(SREACH_FILE, g_nActIndex) < g_nActIndex )
										{
											g_nActIndex = g_nActIndex-1;
										}
										
										g_lindex = g_SREACHFILE_GetSeq(SREACH_FILE, g_nActIndex);
									}
									
									g_lDataflag = 0;
									
									Mem_Set((byte *)stGm.SUBMONITOR_FLAG, 0x00, sizeof(stGm.SUBMONITOR_FLAG));
									Str_Cpy(stGm.SUBMONITOR_FLAG, "0");
									
									Mem_Set( (byte*)g_szIndi_MtrCode, 0x00, sizeof(g_szIndi_MtrCode) );
									Mem_Set( (byte*)g_szIndi_Qty, 0x00, sizeof(g_szIndi_Qty) );
	
									Card_Move("GM_SILSA");
								}
								else
								{
									Next_Gm();
								}
							}
							else
							{
								g_lDataflag = 1;
							}
							
							Set_Index();
						}
					}
					else
					{
						m_lChk = 0;
						g_lDataflag = 1;
						Set_Index();
					}
				}
				break;
				
			case BID_FEE:
				if( MessageBoxEx (CONFIRM_YESNO, "요금내역을 조회하시겠습니까?") != MB_OK)
				{
					break;
				}
				
				g_lDataflag = 1;
				g_lPAYFlag = 0;
				g_nPhotoFlag = 1;
				
				Mem_Set( (byte*)g_szMTR_NUM, 0x00, sizeof(g_szMTR_NUM) );
				Mem_Set( (byte*)g_szUSE_CONT_NUM, 0x00, sizeof(g_szUSE_CONT_NUM) );
				
				Str_Cpy(g_szMTR_NUM, stGm.MTR_NUM);
				Str_Cpy(g_szUSE_CONT_NUM, stGm.USE_CONT_NUM);
				
				SaveInput();
				Set_Index();
				
				Card_Move("GM_PAYHSTR");
				
				break;
				
			case BID_CALCUL:
				if( MessageBoxEx (CONFIRM_YESNO, "요금계산을 하시겠습니까?") != MB_OK)
				{
					break;
				}
				
				g_lDataflag = 1;
				g_lPAYFlag = 0;
				
				Mem_Set( (byte*)g_szMTR_NUM, 0x00, sizeof(g_szMTR_NUM) );
				Mem_Set( (byte*)g_szUSE_CONT_NUM, 0x00, sizeof(g_szUSE_CONT_NUM) );
				
				Str_Cpy(g_szMTR_NUM, stGm.MTR_NUM);
				Str_Cpy(g_szUSE_CONT_NUM, stGm.USE_CONT_NUM);
				
				SaveInput();
				Set_Index();

				if( m_lUserData == 10 )
				{
					if( Str_Len(g_szIndi_Vc) == 0 )
					{
						MessageBoxEx (CONFIRM_OK, "지침을 입력하지 않았습니다.");
						Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
						Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
						break;
					}
				}
				else if( m_lUserData == 20 )
				{
					if( Str_Len(g_szIndi_Vm) == 0 || Str_Len(g_szIndi_Va) == 0 || Str_Len(g_szIndi_Vc) == 0 )
					{
						MessageBoxEx (CONFIRM_OK, "지침을 입력하지 않았습니다.");
						Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);	
						Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
						break;
					}
				}
				else
				{
					if( Str_Len(g_szIndi_Vm) == 0 || Str_Len(g_szIndi_Vc) == 0 )
					{
						MessageBoxEx (CONFIRM_OK, "지침을 입력하지 않았습니다.");
						Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
						Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
						break;
					}
				}
				
				Card_Move("GM_PAYCAL");
				
				break;
				
			case BID_CLIENT:
				g_lDataflag = 1;
				
				SaveInput();
				Set_Index();
				
				Card_Move("GM_CUSTINFO");
				
				break;
				
			case BID_MEMO:
				g_lDataflag = 1;
				g_nMemoFlag = 1;
				
				SaveInput();
				Set_Index();
				
				Card_Move("CM_MRGMEMO");
				
				break;
			
			case BID_MTR_ID_NUM:
				if( Str_Cmp(stGm.COMPENS_REMOVE_ALARM_2, "Y") == 0 )
				{	
				ON_EXIT();
				OnInit(INIT_COMPENSREMOVE);
				}
			    break;
			/*************************/
			/* 상세지침내역          */
			/*************************/
			case BID_OK:
				ON_EXIT();
				OnInit(INIT_MAIN);
				
				break;
			
			/*************************/
			/* 상세지침내역 - 보정기 */
			/*************************/
			case BID_OK2:
				ON_EXIT();
				OnInit(INIT_MAIN);
				
				break;
			
			/*************************/
			/* 상시계수입력          */
			/*************************/
			case BID_SAVE2:
				ShowSip(FALSE);
				g_Sipflag = 0;
				
				if( Save_factor() > 0 )
				{				
					ON_EXIT();
					OnInit(INIT_MAIN);
				}
				
				break;
				
			case BID_CLOSE2:
				ShowSip(FALSE);
				g_Sipflag = 0;
				
				ON_EXIT();
				OnInit(INIT_MAIN);
				
				break;
				
			case BID_PHOTO_VC:
				// 사진 타입 : VC = 1
				Mem_Set( (byte*)m_szPhoto_CompensType, 0x00, sizeof(m_szPhoto_CompensType) );
				Str_Cpy( m_szPhoto_CompensType, "1" );
				
				Shoto_Photo_Compens();
				
				break;
				
			case BID_PHOTO_VA:
				// 사진 타입 : VA = 2
				Mem_Set( (byte*)m_szPhoto_CompensType, 0x00, sizeof(m_szPhoto_CompensType) );
				Str_Cpy( m_szPhoto_CompensType, "2" );
				
				Shoto_Photo_Compens();
				
				break;
				
			case BID_PHOTO_VM:
				// 사진 타입 : VM = 3
				Mem_Set( (byte*)m_szPhoto_CompensType, 0x00, sizeof(m_szPhoto_CompensType) );
				Str_Cpy( m_szPhoto_CompensType, "3" );
				
				Shoto_Photo_Compens();
				
				break;
				
			/*************************/
			/* 사용량 이상세대       */
			/*************************/	
			case BID_SAVE3:
				if( m_lChk > 0 )
				{
					ON_EXIT();
					OnInit(INIT_MAIN);
				}
				else
				{
					MessageBoxEx (CONFIRM_OK, "선택된 항목이 없습니다. 항목을 선택해주세요.");
				}
				break;
			
			case BID_BOX1:
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_BOX1), CHKON);
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_BOX2), CHKOFF);
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_BOX3), CHKOFF);
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_BOX4), CHKOFF);
				
				Mem_Set( (byte*)stGm.MONITOR_FLAG, 0x00, sizeof(stGm.MONITOR_FLAG) );
				Mem_Set( (byte*)stGm.SUBMONITOR_FLAG, 0x00, sizeof(stGm.SUBMONITOR_FLAG) );
				
				Str_Cpy(stGm.MONITOR_FLAG, "10");
				Str_Cpy(stGm.SUBMONITOR_FLAG, "10");
				
				m_lChk = 1;
				
				break;
				
			case BID_BOX2:
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_BOX1), CHKOFF);
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_BOX2), CHKON);
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_BOX3), CHKOFF);
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_BOX4), CHKOFF);
				
				Mem_Set( (byte*)stGm.MONITOR_FLAG, 0x00, sizeof(stGm.MONITOR_FLAG) );
				Mem_Set( (byte*)stGm.SUBMONITOR_FLAG, 0x00, sizeof(stGm.SUBMONITOR_FLAG) );
				
				Str_Cpy(stGm.MONITOR_FLAG, "20");
				Str_Cpy(stGm.SUBMONITOR_FLAG, "20");
				
				m_lChk = 2;
				
				break;
				
			case BID_BOX3:
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_BOX1), CHKOFF);
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_BOX2), CHKOFF);
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_BOX3), CHKON);
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_BOX4), CHKOFF);
				
				Mem_Set( (byte*)stGm.MONITOR_FLAG, 0x00, sizeof(stGm.MONITOR_FLAG) );
				Mem_Set( (byte*)stGm.SUBMONITOR_FLAG, 0x00, sizeof(stGm.SUBMONITOR_FLAG) );
				
				Str_Cpy(stGm.MONITOR_FLAG, "30");
				Str_Cpy(stGm.SUBMONITOR_FLAG, "30");
				
				m_lChk = 3;
				
				break;
				
			case BID_BOX4:
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_BOX1), CHKOFF);
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_BOX2), CHKOFF);
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_BOX3), CHKOFF);
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_BOX4), CHKON);
				
				Mem_Set( (byte*)stGm.MONITOR_FLAG, 0x00, sizeof(stGm.MONITOR_FLAG) );
				Mem_Set( (byte*)stGm.SUBMONITOR_FLAG, 0x00, sizeof(stGm.SUBMONITOR_FLAG) );
				
				Str_Cpy(stGm.MONITOR_FLAG, "40");
				Str_Cpy(stGm.SUBMONITOR_FLAG, "40");
				
				m_lChk = 4;
				
				break;
			
			/*************************/
			/* 보정기 고장           */
			/*************************/	
			case BID_COMPENS_CLOSE:
				Mem_Set( (byte*)szSql, 0x00, sizeof(szSql) );
				Mem_Set( (byte*)szTmp, 0x00, sizeof(szTmp) );
				
				SPRINT(szSql, "SELECT REMOVE_REQ_EMPID FROM GUM_COMPENS_REMOVE_REQ WHERE REQ_YM = '%s' AND DEADLINE_FLAG = '%s' AND MTR_NUM = '%s'", stGm.REQ_YM, stGm.DEADLINE_FLAG, stGm.MTR_NUM);
				g_Sql_RetStr(szSql, 4, szTmp);
				
				if( Str_Cmp(szTmp, "") == 0 )
				{
					Mem_Set((byte*)szSql ,0x00, sizeof(szSql) );
					SPRINT(szSql, "DELETE FROM GUM_COMPENS_REMOVE_REQ WHERE REQ_YM = '%s' AND DEADLINE_FLAG = '%s' AND MTR_NUM = '%s'", stGm.REQ_YM, stGm.DEADLINE_FLAG, stGm.MTR_NUM);
					g_Sql_DirectExecute( szSql );	
				}
				
				ON_EXIT();
				OnInit(INIT_MAIN);
				
				break;
					
			case BID_COMPENS_SIGN:
				fn_Compens_Sign();
				break;
			
			case BID_COMPENS_OK:
				if( fn_Compens_Save() )
				{
					ON_EXIT();
					OnInit(INIT_MAIN);
				}	
				break;
				
			case BID_COMPENS_CONF_NM:
				g_EditCtrl_ShowEditInput( Get_hDlgCtrlByID(EDT_COMPENS_CONF_NM), EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_COMPENS_CONF_NM)) );
				break;
			
			case BID_REMOTE:

				Mem_Set((byte *)strMsg      , 0x00, sizeof(strMsg));
		
				Str_Cat(strMsg, "검침일시 : ");
				Str_Cat(strMsg, stGm.RECENT_GMTR_JOB_YMD_YEAR);
				Str_Cat(strMsg, "년 ");
				Str_Cat(strMsg, stGm.RECENT_GMTR_JOB_YMD_MONTHS);
				Str_Cat(strMsg, "월 ");
				Str_Cat(strMsg, stGm.RECENT_GMTR_JOB_YMD_DAYS);
				Str_Cat(strMsg, "일");
				Str_Cat(strMsg, "\n 검침지침 : ");
				Str_Cat(strMsg, stGm.RECENT_INDI_MTR_MM_VC);
				
				MessageBoxEx(CONFIRM_OK, strMsg);

				// MessageBoxEx(CONFIRM_OK, "검침일시 :  \n 검침지침 :");
				break;
		}
	}
	
	/*=======================================================================================
	함수명 : OnUart
	기  능 : 카메라
	Param  : 
	Return : 
	========================================================================================*/
	void OnUart( long nEvent, long nData )
	{
		char szfilenm[256];
		char szTmp[200];
		
		if( m_bFirst == INIT_NUM )
		{
			if( nEvent == UART_CAMERA )
			{
				if( nData == 1 )
				{
					Mem_Set( (byte*)szfilenm, 0x00, sizeof(szfilenm) );
					SPRINT( szfilenm, "Camera/%s",  m_szfilenm,0, 0 );
					
					if( FFS_Exist(szfilenm) )
					{
						MessageBoxEx( MESSAGE, "사진을 저장중입니다." );
						
						FFS_Copy( szfilenm, g_szphoto );
						
						VmSleep( 100 );

						Mem_Set( (byte*)szTmp, 0x00, sizeof(szTmp) );
						
						if( Str_Cmp(m_szPhoto_CompensType, "1" ) == 0 )
						{	
							SPRINT( szTmp, "UPDATE REGUMDATA SET PHOTO_COMPENS_VC_YN = 'S' WHERE ROWID = '%s'", stGm.ROWID, 0, 0 );
							g_Sql_DirectExecute( szTmp ); 
							
							Mem_Set( (byte*)stGm.PHOTO_COMPENS_VC_YN, 0x00, sizeof(stGm.PHOTO_COMPENS_VC_YN) );
							Str_Cpy( stGm.PHOTO_COMPENS_VC_YN, "S" );
						}
						else if( Str_Cmp(m_szPhoto_CompensType, "2" ) == 0  )
						{
							SPRINT( szTmp, "UPDATE REGUMDATA SET PHOTO_COMPENS_VA_YN = 'S' WHERE ROWID = '%s'", stGm.ROWID, 0, 0 );
							g_Sql_DirectExecute( szTmp ); 
						
							Mem_Set( (byte*)stGm.PHOTO_COMPENS_VA_YN, 0x00, sizeof(stGm.PHOTO_COMPENS_VA_YN) );
							Str_Cpy( stGm.PHOTO_COMPENS_VA_YN, "S" );
						}
						else if( Str_Cmp(m_szPhoto_CompensType, "3" ) == 0  )
						{
							SPRINT( szTmp, "UPDATE REGUMDATA SET PHOTO_COMPENS_VM_YN = 'S' WHERE ROWID = '%s'", stGm.ROWID, 0, 0 );
							g_Sql_DirectExecute( szTmp ); 
						
							Mem_Set( (byte*)stGm.PHOTO_COMPENS_VM_YN, 0x00, sizeof(stGm.PHOTO_COMPENS_VM_YN) );
							Str_Cpy( stGm.PHOTO_COMPENS_VM_YN, "S" );
						}
						
						VmSleep( 100 );
						
						FFS_Delete( szfilenm );
						
						VmSleep( 100 );
						
						// FR26002();
						NUM_DRAW();
					}
				}
			}
		}
		
		return;
	}
	
	/*=======================================================================================
	함수명 : OnSelect
	기  능 : 콤보박스에 따른 화면 변화
	Param  : 
	Return : 
	========================================================================================*/	
	void OnSelect(long Index)
	{
		long i = 0;
		char szMtr_Code[5];
		char strMsg[100];
		
		if(m_bFirst == INIT_MAIN)
		{		
			/***********************/
			/* 계량기              */
			/***********************/   
			if(10 == m_lUserData)
			{
				Mem_Set( (byte*)m_szgr, 0x00, sizeof(m_szgr));
				Str_Cpy(m_szgr, EditCtrl_GetStr(Get_hDlgCtrlByID(CMB_RESULT)));
				
				/***********************/
				/* 2:부재              */
				/***********************/       
				if( Str_Cmp(m_szgr, "2:부재") == 0 )
				{
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), RED);
					
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "");
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), "");
					Mem_Set( (byte*)m_szIndiQty, 0x00, sizeof(m_szIndiQty));
				}
				/***********************/
				/* C:없음, L:문자발송  */
				/***********************/
				else if( Str_Cmp(m_szgr,"C:없음") == 0 || Str_Cmp(m_szgr,"L:문자발송") == 0 )
				{
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);

					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "");
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), "");
					Mem_Set( (byte*)m_szIndiQty, 0x00, sizeof(m_szIndiQty));
				}
				else
				{
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
				}
			}
			/***********************/
			/* 보정기              */
			/***********************/ 
			else if(20 == m_lUserData)
			{
				Str_Cpy(m_szbj, EditCtrl_GetStr(Get_hDlgCtrlByID(CMB_RESULT)));
				
				if( Str_Cmp(m_szbj,"2:부재") == 0 )
				{
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), FALSE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), RED);
					
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "");
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VA), "");
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), "");
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), "");
					Mem_Set( (byte*)m_szIndiQty, 0x00, sizeof(m_szIndiQty));
				}
				else if( Str_Cmp(m_szbj,"C:없음") == 0 || Str_Cmp(m_szbj,"L:문자발송") == 0 )
				{
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), FALSE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);
					
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "");
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VA), "");
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), "");
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), "");
					Mem_Set( (byte*)m_szIndiQty, 0x00, sizeof(m_szIndiQty));
				}
				else
				{
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
				}
			}
			/***********************/
			/* 온도, 온압 보정기   */
			/***********************/ 
			else
			{
				Str_Cpy(m_sztp, EditCtrl_GetStr(Get_hDlgCtrlByID(CMB_RESULT)));
				
				if( Str_Cmp(m_sztp,"2:부재") == 0 )
				{
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), FALSE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), RED);
					
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "");
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VA), "");
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), "");
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), "");
					Mem_Set( (byte*)m_szIndiQty, 0x00, sizeof(m_szIndiQty));
				}
				else if( Str_Cmp(m_sztp,"C:없음") == 0 || Str_Cmp(m_sztp,"L:문자발송") == 0 )
				{
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), FALSE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);
					
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "");
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VA), "");
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), "");
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), "");
					Mem_Set( (byte*)m_szIndiQty, 0x00, sizeof(m_szIndiQty));
				}
				else
				{
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
				}
			}
			
			// 지침 값을 입력 후 코드값을 바꿧을 경우 계산이 다시 되게 하기위해서.
			if( m_lUserData == 10 )
			{
				Mem_Set( (byte*)stGm.INDI_SET_VC, 0x00, sizeof(stGm.INDI_SET_VC));
				Str_Cpy( stGm.INDI_SET_VC, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
				Cal_UseQty( stGm.INDI_SET_VC );
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), m_szIndiQty);
				
				if( Str_AtoI(m_szIndiQty) > Str_AtoI(stGm.MAX_GMTR_QTY) )
				{
					Mem_Set((byte *)strMsg      , 0x00, sizeof(strMsg));
		
					Str_Cat(strMsg, "최대 사용량을 초과하였습니다.\n ");
					Str_Cat(strMsg, "\n현재 사용량 : ");
					Str_Cat(strMsg, m_szIndiQty);
					Str_Cat(strMsg, "\n최대 사용량 : ");
					Str_Cat(strMsg, stGm.MAX_GMTR_QTY);
					
					MessageBoxEx(ERROR_OK, strMsg);
					
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "");
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), "");
					
					Mem_Set( (byte*)stGm.INDI_SET_VC, 0x00, sizeof(stGm.INDI_SET_VC));
					Str_Cpy( stGm.INDI_SET_VC, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
					
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
					return;
				}
			}
			else
			{
				Mem_Set( (byte*)szMtr_Code, 0x00, sizeof(szMtr_Code));
				Mem_Set( (byte*)stGm.INDI_SET_VC, 0x00, sizeof(stGm.INDI_SET_VC));
				Str_Cpy( stGm.INDI_SET_VC, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
				
				i = SearchStr( EditCtrl_GetStr(Get_hDlgCtrlByID(CMB_RESULT)), RE_GM_CODE );
				if(i >= 0)
				{
					Str_Cpy(szMtr_Code, RE_GM_CODE[i].Code);
				}

				if( Str_Cmp(szMtr_Code, "3") == 0 )
				{
					Mem_Set( (byte*)m_szIndiQty, 0x00, sizeof(m_szIndiQty));
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), "");
				}
				else
				{
					Cal_UseQty( stGm.INDI_SET_VC );
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), m_szIndiQty);
					
					if( Str_AtoI(m_szIndiQty) > Str_AtoI(stGm.MAX_GMTR_QTY) )
					{
						Mem_Set((byte *)strMsg      , 0x00, sizeof(strMsg));
						
						Str_Cat(strMsg, "최대 사용량을 초과하였습니다.\n ");
						Str_Cat(strMsg, "\n현재 사용량 : ");
						Str_Cat(strMsg, m_szIndiQty);
						Str_Cat(strMsg, "\n최대 사용량 : ");
						Str_Cat(strMsg, stGm.MAX_GMTR_QTY);
						
						MessageBoxEx(ERROR_OK, strMsg);
						
						EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "");
						EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), "");
						
						Mem_Set( (byte*)stGm.INDI_SET_VC, 0x00, sizeof(stGm.INDI_SET_VC));
						Str_Cpy( stGm.INDI_SET_VC, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
						
						Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
						Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
						return;
					}
				}
			}
		}
		
		ON_DRAW();
		
		GrDev_Refresh();
	}

	/*=======================================================================================
	함수명 : Set_Index
	기  능 : 최종 인덱스 저장한다.
	Param  : 
 	Return : TRUE :성공
 			 FALSE:파일이 없을시에 실패
	========================================================================================*/
	void Set_Index(void)
	{
		char sztmp[101];

		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));
		SPRINT(sztmp, "UPDATE RCV_LOG SET PARAM8 =%d WHERE GUBUN = '10' ", g_lindex, 0, 0);
		g_Sql_DirectExecute(sztmp);
	}

	/*=======================================================================================
	함수명 : SetStyle
	기  능 : 화면 스타일
	Param  : 
 	Return : 
	========================================================================================*/
	void SetStyle(void)
	{
		if( m_bFirst == INIT_MAIN )
		{	
			/*********************************/
			/* 화면 Style Setting            */
			/*********************************/		
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA1) , EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA2) , EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA4) , EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA5) , EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA7) , EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA8) , EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_USEQTY), EDITALIGN_MIDDLE|EDITALIGN_RIGHT);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(EDT_VC)    , EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(EDT_VA)	   , EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(EDT_VM)    , EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA11), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA12), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA13), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA14), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA99), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(CMB_RESULT), EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA3) , EDITALIGN_MIDDLE);
			
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_ZERO ) , EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_ONE  ) , EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_TWO  ) , EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_THREE) , EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_FOUR ) , EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_FIVE ) , EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_SIX  ) , EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_SEVEN) , EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_EIGHT) , EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_NINE ) , EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_NUMDEL), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_PREVPG), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_NEXTPG), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
			
			EditCtrl_SetMultiLine(Get_hDlgCtrlByID(TXT_DATA3), TRUE, 2, EDITSEP_NONE );
			
			EditCtrl_SetFont( Get_hDlgCtrlByID(TXT_ZERO ) , theDevInfo.m_nFontLageType );
			EditCtrl_SetFont( Get_hDlgCtrlByID(TXT_ONE  ) , theDevInfo.m_nFontLageType );
			EditCtrl_SetFont( Get_hDlgCtrlByID(TXT_TWO  ) , theDevInfo.m_nFontLageType );
			EditCtrl_SetFont( Get_hDlgCtrlByID(TXT_THREE) , theDevInfo.m_nFontLageType );
			EditCtrl_SetFont( Get_hDlgCtrlByID(TXT_FOUR ) , theDevInfo.m_nFontLageType );
			EditCtrl_SetFont( Get_hDlgCtrlByID(TXT_FIVE ) , theDevInfo.m_nFontLageType );
			EditCtrl_SetFont( Get_hDlgCtrlByID(TXT_SIX  ) , theDevInfo.m_nFontLageType );
			EditCtrl_SetFont( Get_hDlgCtrlByID(TXT_SEVEN) , theDevInfo.m_nFontLageType );
			EditCtrl_SetFont( Get_hDlgCtrlByID(TXT_EIGHT) , theDevInfo.m_nFontLageType );
			EditCtrl_SetFont( Get_hDlgCtrlByID(TXT_NINE ) , theDevInfo.m_nFontLageType );
			EditCtrl_SetFont( Get_hDlgCtrlByID(TXT_NUMDEL), theDevInfo.m_nFontLageType );
			
			/****************************************************************************************************************/
			/* 상시계수입력																									*/
			/* GMTR_OBJ_FLAG(검침대상구분) = 10:계량기, 20:보정기, 30:계량기+보정기, 40: 일체형(온도), 41: 일체형(온도압력) */
			/* COMPENS_FLAG(보정구분) = 10:미보정, 20:보정, 30:계약보정, 40:일체형                                          */
			/* GMTR_OBJ_FLAG = 10 -> m_lUserData = 10 계량기									  							*/
			/* GMTR_OBJ_FLAG = 40 -> m_lUserData = 40 온도보정기															*/
			/* GMTR_OBJ_FLAG = 41 && COMPENS_FLAG > 40 -> m_lUserData = 41 온압보정기										*/
			/* 위 조건과 다른 경우 -> m_lUserData = 20 보정기																*/
			/****************************************************************************************************************/
			/*********************************/
			/* EDT화면 초기화                */
			/*********************************/
			DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
			DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
			DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );
			DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC) , FALSE );
			DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA) , FALSE );
			DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM) , FALSE );
			
			/********************************/
			/* m_lUserData, BID_NUM Setting */
			/********************************/
			// 계량기
			if( Str_Cmp(stGm.GMTR_OBJ_FLAG, "10" ) == 0  )
			{
				m_lUserData = 10;
	
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_NUM), "비보정");
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_NUM), FALSE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_NUM), TRUE );
				ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_NUM), BTNMENUFRCOLOR);
				ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_NUM), BTNCTRLBKCOLOR);
			}
			// 온도보정기
			else if( Str_Cmp(stGm.GMTR_OBJ_FLAG, "40" ) == 0 )
			{
				m_lUserData = 40;
	
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_NUM), "온도");
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_NUM), TRUE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_NUM), FALSE );
				ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_NUM), RED);
				ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_NUM), BTNCTRLBKCOLOR);
			}
			// 온압보정기
			else if( Str_Cmp(stGm.GMTR_OBJ_FLAG, "41" ) == 0 && Str_AtoI(stGm.COMPENS_FLAG) > 40 )
			{
				m_lUserData = 41;
	
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_NUM), "온압");
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_NUM), TRUE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_NUM), FALSE );
				ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_NUM), RED);
				ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_NUM), BTNCTRLBKCOLOR);
			}
			// 보정기
			else
			{	
				m_lUserData = 20;
				
				if( Str_Cmp( stGm.SELF_GMTR_YN, "Y" ) == 0 )
				{
					ButCtrl_SetText(Get_hDlgCtrlByID(BID_NUM), "보정");
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_NUM), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_NUM), TRUE );
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_NUM), BTNMENUFRCOLOR);
					ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_NUM), BTNCTRLBKCOLOR);
				}
				else
				{
					ButCtrl_SetText(Get_hDlgCtrlByID(BID_NUM), "보정");
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_NUM), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_NUM), FALSE );
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_NUM), RED);
					ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_NUM), BTNCTRLBKCOLOR);
				}
			}
			
			// 2017-04-25 Sanghyun Lee, 검침실사 화면 체크를 위해 해당 정보 저장.
			g_nUserData = m_lUserData;
			
			/***********************************************************/
			/* CMB_RESULT, EDT_VC, EDT_VA, EDT_VM, BID_MESSAGE Setting */
			/***********************************************************/
			// m_szgr = 검침코드 콤보박스 값
			// 계량기
			if( 10 == m_lUserData )
			{
				if( Str_Cmp(m_szgr, "") == 0 )
				{
					EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), RE_GM_CODE[0].Str );
					
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC) , FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA) , FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM) , FALSE );
					
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);
				}
				else
				{	
					EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), m_szgr);
					
					if( Str_Cmp(m_szgr, "2:부재") == 0 )
					{
						DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
						DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), FALSE );
						DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
						DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC) , TRUE );
						DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA) , TRUE );
						DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM) , TRUE );
						
						ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), RED);	
					}
					else
					{
						DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
						DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
						DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );
						DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC) , FALSE );
						DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA) , FALSE );
						DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM) , FALSE );
						
						ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);
					}
				}
	
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), "교체일");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA15), "지침");
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_USEQTY), "사용량");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA17), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA18), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA19), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA20), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA21), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA22), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA23), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA24), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VA), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), "");
				
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA13), 	STARTX    , STARTY+345,  196, 510);	//교체일
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA14),	STARTX+196, STARTY+345,  500, 510);	//교체날짜
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA15),	STARTX+500, STARTY+345,  785, 510);	//지침
				BUTSETRANGE(Get_hDlgCtrlByID(BID_USEQTY),	STARTX+785, STARTY+345, 1000, 510);	//사용량

				BUTSETRANGE(Get_hDlgCtrlByID(BID_THMONTH),	STARTX    , STARTY+410,  196, 575); //당월
				EDITSETRANGE(Get_hDlgCtrlByID(CMB_RESULT),	STARTX+196, STARTY+410,  500, 575); //검침코드
				BUTSETRANGE(Get_hDlgCtrlByID(CMB_RESULT+1),	STARTX+400, STARTY+411,  500, 574);	//검침코드
				EDITSETRANGE(Get_hDlgCtrlByID(EDT_VC),		STARTX+500, STARTY+410,  785, 575);	//지침입력
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_USEQTY),	STARTX+785, STARTY+410, 1000, 575);	//사용량

				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA11),	STARTX    , STARTY+475,  196, 640);	//전월
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA17),	STARTX+196, STARTY+475,  500, 640);	//전월검침코드
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA18),	STARTX+500, STARTY+475,  785, 640);	//전월지침
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA19),	STARTX+785, STARTY+475, 1000, 640);	//전월사용량

				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA12),	STARTX    , STARTY+540,  196, 705);	//전전월			
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA20),	STARTX+196, STARTY+540,  500, 705);	//전전월검침코드
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA21),	STARTX+500, STARTY+540,  785, 705);	//전전월지침
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA22),	STARTX+785, STARTY+540, 1000, 705);	//전전월사용량
				
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA15), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA17), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA18), EDITALIGN_MIDDLE|EDITALIGN_RIGHT);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA19), EDITALIGN_MIDDLE|EDITALIGN_RIGHT);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA20), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA21), EDITALIGN_MIDDLE|EDITALIGN_RIGHT);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA22), EDITALIGN_MIDDLE|EDITALIGN_RIGHT);
				
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(TXT_DATA15), TRUE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(TXT_DATA22), TRUE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(TXT_USEQTY), TRUE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(TXT_DATA23), FALSE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(TXT_DATA24), FALSE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA)    , FALSE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM)    , FALSE);
			}
			// 보정기
			else if( 20 == m_lUserData )
			{
				if( Str_Cmp(m_szbj, "") == 0 )
				{
					EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), RE_GM_CODE[0].Str );
					
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC) , FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA) , FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM) , FALSE );
					
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);				
				}
				else
				{
					EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), m_szbj);
					
					if( Str_Cmp(m_szbj, "2:부재") == 0 )
					{
						DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
						DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), FALSE );
						DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
						DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC) , TRUE );
						DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA) , TRUE );
						DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM) , TRUE );
						
						ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), RED);		
					}
					else
					{
						DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
						DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
						DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );
						DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC) , FALSE );
						DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA) , FALSE );
						DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM) , FALSE );
						
						ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);
					}
				}
				
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA14), "VC");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA15), "VA");
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_USEQTY), "VM");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA17), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA18), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA19), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA20), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA21), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA22), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA23), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA24), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VA), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), "");
				
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA13),  STARTX    , STARTY+345,  392, STARTY+410);	//교체일
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA14),  STARTX+392,	STARTY+345,  595, STARTY+410);	//VC
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA15),  STARTX+595,	STARTY+345,  798, STARTY+410);	//VA
				BUTSETRANGE(Get_hDlgCtrlByID(BID_USEQTY),   STARTX+798,	STARTY+345, 1000, STARTY+410);	//VM(사용량추이)

				BUTSETRANGE(Get_hDlgCtrlByID(BID_THMONTH),	STARTX    ,	STARTY+410,  196, STARTY+475);	//당월
				EDITSETRANGE(Get_hDlgCtrlByID(CMB_RESULT),	STARTX+196, STARTY+410,  392, STARTY+475);	//검침코드
				BUTSETRANGE(Get_hDlgCtrlByID(CMB_RESULT+1),	STARTX+308, STARTY+411,  392, STARTY+474);	//검침코드
				EDITSETRANGE(Get_hDlgCtrlByID(EDT_VC),		STARTX+390,	STARTY+410,  595, STARTY+475);	//VC입력
				EDITSETRANGE(Get_hDlgCtrlByID(EDT_VA),		STARTX+595,	STARTY+410,  798, STARTY+475);	//VA입력
				EDITSETRANGE(Get_hDlgCtrlByID(EDT_VM), 		STARTX+798,	STARTY+410, 1000, STARTY+475);	//VM입력
				
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA11),	STARTX	  ,	STARTY+475,  196, STARTY+540);	//전월
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA17),	STARTX+196,	STARTY+475,  392, STARTY+540);	//전월코드
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA18),	STARTX+392,	STARTY+475,  595, STARTY+540);	//전월VC
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA19),	STARTX+595,	STARTY+475,  798, STARTY+540);	//전월VA
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA20),	STARTX+798,	STARTY+475, 1000, STARTY+540);	//전월VM

				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA12),	STARTX	  , STARTY+540,  196, STARTY+605);	//전전월
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA21),	STARTX+196, STARTY+540,  392, STARTY+605);	//전전월코드
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA22),	STARTX+392, STARTY+540,  595, STARTY+605);	//전전월VC
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA23),	STARTX+595, STARTY+540,  798, STARTY+605);	//전전월VA
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA24),	STARTX+798, STARTY+540, 1000, STARTY+605);	//전전월VM
				
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA15), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA17), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA18), EDITALIGN_MIDDLE|EDITALIGN_RIGHT);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA19), EDITALIGN_MIDDLE|EDITALIGN_RIGHT);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA20), EDITALIGN_MIDDLE|EDITALIGN_RIGHT);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA21), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA22), EDITALIGN_MIDDLE|EDITALIGN_RIGHT);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA23), EDITALIGN_MIDDLE|EDITALIGN_RIGHT);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA24), EDITALIGN_MIDDLE|EDITALIGN_RIGHT);
				
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(TXT_DATA15), TRUE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(TXT_DATA21), TRUE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(TXT_DATA22), TRUE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(TXT_DATA23), TRUE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(TXT_DATA24), TRUE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA)    , TRUE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM)    , TRUE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(TXT_USEQTY), FALSE);
			}
			// 온도보정기, 온압보정기
			else if( 41 == m_lUserData || 40 == m_lUserData )
			{
				if( Str_Cmp(m_sztp, "") == 0 )
				{
					EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), RE_GM_CODE[0].Str );
					
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
					
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);
				}
				else
				{
					EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), m_sztp);
					
					if( Str_Cmp(m_sztp,"2:부재") == 0 )
					{
						DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
						DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), FALSE );
						DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
						DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
						DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
						DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );
						
						ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), RED);	
					}
					else
					{
						DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
						DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
						DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );
						DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
						DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), FALSE );
						DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
						
						ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);
					}
				}
				
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA14), "VC");
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_USEQTY), "VM");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA16), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA17), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA18), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA19), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA20), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA21), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA22), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA23), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA24), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VA), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), "");
				
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA13),  STARTX    ,	STARTY+345,  480, STARTY+410);	//교체일
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA14),  STARTX+480, STARTY+345,  740, STARTY+410);	//VC
				BUTSETRANGE(Get_hDlgCtrlByID(BID_USEQTY),   STARTX+740, STARTY+345, 1000, STARTY+410);	//VM

				BUTSETRANGE(Get_hDlgCtrlByID(BID_THMONTH),  STARTX    , STARTY+410,  196, STARTY+475);	//당월
				EDITSETRANGE(Get_hDlgCtrlByID(CMB_RESULT),  STARTX+196, STARTY+410,  480, STARTY+475);	//검침코드
				BUTSETRANGE(Get_hDlgCtrlByID(CMB_RESULT+1), STARTX+390, STARTY+411,  480, STARTY+474);	//검침코드
				EDITSETRANGE(Get_hDlgCtrlByID(EDT_VC), 	    STARTX+480, STARTY+410,  740, STARTY+475);	//VC입력
				EDITSETRANGE(Get_hDlgCtrlByID(EDT_VM),      STARTX+740, STARTY+410, 1000, STARTY+475);	//VM입력

				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA11),  STARTX    , STARTY+475,  196, STARTY+540);	//전월
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA16),  STARTX+196, STARTY+475,  480, STARTY+540);	//전월코드
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA17),  STARTX+480, STARTY+475,  740, STARTY+540);	//전월VC
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA18),  STARTX+740, STARTY+475, 1000, STARTY+540);	//전월VM

				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA12),  STARTX    , STARTY+540,  196, STARTY+605);	//전전월
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA19),  STARTX+196, STARTY+540,  480, STARTY+605);	//전전월코드
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA20),  STARTX+480, STARTY+540,  740, STARTY+605);	//전전월VC
				EDITSETRANGE(Get_hDlgCtrlByID(TXT_DATA21),  STARTX+740, STARTY+540, 1000, STARTY+605);	//전전월VM
				
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA16), EDITALIGN_CENTER|EDITALIGN_MIDDLE);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA17), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA18), EDITALIGN_MIDDLE|EDITALIGN_RIGHT);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA19), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA20), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA21), EDITALIGN_MIDDLE|EDITALIGN_RIGHT);
				EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA22), EDITALIGN_MIDDLE|EDITALIGN_RIGHT);

				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(TXT_DATA15), FALSE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(TXT_DATA22), FALSE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(TXT_DATA23), FALSE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(TXT_DATA24), FALSE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(TXT_USEQTY), FALSE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA)	 , FALSE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC)	 , TRUE);
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM)	 , TRUE);
			}
		}	
	}
	
	/*=======================================================================================
	함수명 : SetData
	기  능 : Data Setting
	Param  : 
	Return : 
	========================================================================================*/
	void SetData(void)
	{
		long i;
		char szindex[10];
		handle hdb = NULL;
		handle hstmt = NULL;
		SQLITE sql = NewSqLite();

		Mem_Set((byte*)&stGm, 0x00, sizeof(stGm));

		hdb = sql->Open(sql);
		
		if( hdb == NULL )
		{
			goto Finally;
		}

		hstmt = sql->CreateStatement(sql,
		" SELECT ROWID, REQ_YM, DEADLINE_FLAG, MTR_NUM, GMTR_APPLY_YMD \
			   , GMTR_OBJ_FLAG, SUPPLY_STS_CD, SUPPLY_STS_WHY, STR_IND_APPLY_YMD, BASE_YMD \
			   , MTR_ID_NUM, MTR_LOC_FLAG, MTR_RESOU_FLAG, GRD_TITLE, USAGE_TITLE \
			   , HOUSE_NUM_ORD, DONG_ORD, MTR_COURSE, TRIM(USE_CONT_NUM), PROD_CD \
			   , CONT_YMD, CNL_YMD, PAY_METHOD, NONPAY_EXIST_YN, ZIP_NO1 \
			   , ZIP_NO2, AREA, TOWN, VILLAGE, ADDR1_M \
			   , TRIM(ADDR1_S), TRIM(CO_LIVE_NM), DONG_NUM, HOSU, TRIM(BLD_NM) \
			   , BLD_NUM, DETA_FLOOR, NEW_ADDR_UNION, CUST_NUM, CUST_TYPE_CD \
			   , CUST_NM, TRIM(FIRM_NM), BIZ_REGI_NUM, SOC_NUM, REPRE_NM \
			   , TRIM(CP_DDD), TRIM(CP_EXN), TRIM(CP_NUM), TRIM(OWNHOUSE_TEL_DDD), TRIM(OWNHOUSE_TEL_EXN) \
			   , TRIM(OWNHOUSE_TEL_NUM), BEFO_GMTR_CD_1, BEFO_MM_INDI_MTR_1, BEFO_MM_INDI_COMPENS_VA_1, BEFO_MM_INDI_COMPENS_VC_1 \
			   , BEFO_GMTR_CD_2, BEFO_MM_INDI_MTR_2, BEFO_MM_INDI_COMPENS_VA_2, BEFO_MM_INDI_COMPENS_VC_2, BEFO_GMTR_CD_3 \
			   , BEFO_MM_INDI_MTR_3, BEFO_MM_INDI_COMPENS_VA_3, BEFO_MM_INDI_COMPENS_VC_3, BEFO_YY_GMTR_CD, BEFO_YY_MTR \
			   , BEFO_YY_COMPENS_VA, BEFO_YY_COMPENS_VC, BEFO_MM_USE_QTY_1, BEFO_MM_USE_QTY_2, BEFO_MM_USE_QTY_3 \
			   , BEFO_YM_USE_QTY, TRIM(MTR_CHG_YMD), MTR_REPL_WHY, MTR_INDI_CUST, INDI_COMPENS_CIVIL_SERV_VA \
			   , INDI_COMPENS_CIVIL_SERV_VC, TRIM(RMK), MTR_WORK_CODE, INDI_SET_VM, INDI_SET_VA \
			   , INDI_SET_VC, INDI_DATE, SEND_YN, INDI_QTY, COMPENS_FLAG \
			   , GCHK_FLAG, GMTR_YM_FLAG, EBPP_FLAG, MTR_YN, MONITOR_FLAG \
			   , CUST_TRND_YN, GMETER_SEND_YN, CURR_TEMPER, CURR_PRES, CURR_REVIS_PARA \
			   , MAX_GMTR_QTY, LAW_TOWN, NEW_ROAD_NM, NEW_ADDR_M, NEW_ADDR_S \
			   , BIZ_TYPE_YN, SAME_GMTR_YN, SELF_GMTR_YN, MTR_FORM, TRIM(CHK_MEMO) \
			   , INSP_YN, INSP_MEMO, INDI_INSP_VM, INDI_INSP_VA, INDI_INSP_VC \
			   , INSP_YMD, INSP_SAVE_YN, SMS_GMTR_MAN_YN, NONPAY_MANAGE_SEC, SMS_CP_DDD \
			   , SMS_CP_EXN, SMS_CP_NUM, COMPENS_REMOVE_ALARM, MTR_DIGIT_CNT, SELF_GMTR_STR_YMD \
			   , SELF_GMTR_END_YMD, BEFO_GMTR_SMS_YN, GMTR_MANAGE_STS, DEADLINE_CHG_YN, COMPENS_REMOVE_ALARM_2 \
			   , INST_PLACE_NUM, OLD_COMPENS_REMOVE_ALARM_2, PHOTO_MTR_YN, PHOTO_COMPENS_VC_YN, PHOTO_COMPENS_VA_YN \
			   , PHOTO_COMPENS_VM_YN, GUM_TYPE, USE_CONT_STS_CD,REMOTE_GMTR_YN,RECENT_INDI_MTR_MM_VC,RECENT_GMTR_JOB_YMD, SUBSTR(RECENT_GMTR_JOB_YMD,0,5) AS RECENT_GMTR_JOB_YMD_YEAR \
		       , SUBSTR(RECENT_GMTR_JOB_YMD,5,2) AS RECENT_GMTR_JOB_YMD_MONTHS , SUBSTR(RECENT_GMTR_JOB_YMD,7,2) AS RECENT_GMTR_JOB_YMD_DAYS , DISC_CUST_YN\
		    FROM REGUMDATA WHERE ROWID = ? \
		   ORDER BY HOUSE_NUM_ORD, DONG_ORD, MTR_COURSE "
		);
		
		if( hstmt == NULL )
		{
			PRINT("::SQL_CreateStatement fail [%s]", sql->GetLastError(sql), 0, 0);
			goto Finally;
		}

		i = 0;
		Mem_Set((byte*)&szindex, 0x00, sizeof(szindex));
		Str_ItoA(g_lindex,szindex,10);

		sql->Bind(sql, i++, 'U', (long*)&szindex , 4, DECRYPT);

		if(sql->Execute(sql) == FALSE)
		{
			PRINT("::SQL_Execute fail [%s]", sql->GetLastError(sql), 0, 0);
			goto Finally;
		}

		if(sql->Next(sql) == TRUE )
		{	
			i = 0;
			sql->GetValue( sql, i++, 'U', (long*) stGm.ROWID						, 5  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.REQ_YM						, 6  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.DEADLINE_FLAG				, 2  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.MTR_NUM						, 9  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.GMTR_APPLY_YMD				, 8  + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.GMTR_OBJ_FLAG				, 2  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.SUPPLY_STS_CD				, 20 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.SUPPLY_STS_WHY				, 20 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.STR_IND_APPLY_YMD			, 8  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BASE_YMD						, 8  + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.MTR_ID_NUM					, 20 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.MTR_LOC_FLAG					, 2  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.MTR_RESOU_FLAG				, 2  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.GRD_TITLE					, 30 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.USAGE_TITLE					, 30 + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.HOUSE_NUM_ORD				, 40 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.DONG_ORD						, 40 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.MTR_COURSE					, 5  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.USE_CONT_NUM					, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.PROD_CD						, 30 + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.CONT_YMD						, 8  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.CNL_YMD						, 8  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.PAY_METHOD					, 20 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.NONPAY_EXIST_YN				, 1  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.ZIP_NO1						, 3  + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.ZIP_NO2						, 3  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.AREA							, 30 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.TOWN							, 30 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.VILLAGE						, 30 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.ADDR1_M						, 30 + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.ADDR1_S						, 30 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.CO_LIVE_NM					, 60 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.DONG_NUM						, 20 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.HOSU							, 20 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BLD_NM						, 60 + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.BLD_NUM						, 20 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.DETA_FLOOR					, 100+ 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.NEW_ADDR_UNION				, 100+ 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.CUST_NUM						, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.CUST_TYPE_CD					, 2  + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.CUST_NM						, 30 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.FIRM_NM						, 50 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BIZ_REGI_NUM					, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.SOC_NUM						, 13 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.REPRE_NM						, 30 + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.CP_DDD						, 4  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.CP_EXN						, 4  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.CP_NUM						, 4  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.OWNHOUSE_TEL_DDD				, 4  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.OWNHOUSE_TEL_EXN				, 4  + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.OWNHOUSE_TEL_NUM				, 4  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_GMTR_CD_1				, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_MM_INDI_MTR_1			, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_MM_INDI_COMPENS_VA_1	, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_MM_INDI_COMPENS_VC_1	, 10 + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_GMTR_CD_2				, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_MM_INDI_MTR_2			, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_MM_INDI_COMPENS_VA_2	, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_MM_INDI_COMPENS_VC_2	, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_GMTR_CD_3				, 10 + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_MM_INDI_MTR_3			, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_MM_INDI_COMPENS_VA_3	, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_MM_INDI_COMPENS_VC_3	, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_YY_GMTR_CD				, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_YY_MTR					, 10 + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_YY_COMPENS_VA			, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_YY_COMPENS_VC			, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_MM_USE_QTY_1			, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_MM_USE_QTY_2			, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_MM_USE_QTY_3			, 10 + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_YM_USE_QTY				, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.MTR_CHG_YMD					, 8  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.MTR_REPL_WHY					, 20 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.MTR_INDI_CUST				, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.INDI_COMPENS_CIVIL_SERV_VA	, 10 + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.INDI_COMPENS_CIVIL_SERV_VC	, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.RMK							, 200+ 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.MTR_WORK_CODE				, 2  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.INDI_SET_VM					, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.INDI_SET_VA					, 10 + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.INDI_SET_VC					, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.INDI_DATE					, 16 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.SEND_YN						, 1  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.INDI_QTY						, 9  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.COMPENS_FLAG					, 2  + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.GCHK_FLAG					, 2  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.GMTR_YM_FLAG					, 2  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.EBPP_FLAG					, 1  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.MTR_YN						, 1  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.MONITOR_FLAG					, 2  + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.CUST_TRND_YN					, 1  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.GMETER_SEND_YN				, 1  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.CURR_TEMPER					, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.CURR_PRES					, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.CURR_REVIS_PARA				, 10 + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.MAX_GMTR_QTY					, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.LAW_TOWN						, 30 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.NEW_ROAD_NM					, 200+ 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.NEW_ADDR_M					, 30 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.NEW_ADDR_S					, 30 + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.BIZ_TYPE_YN					, 1  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.SAME_GMTR_YN					, 1  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.SELF_GMTR_YN					, 2  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.MTR_FORM						, 20 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.CHK_MEMO						, 200+ 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.INSP_YN						, 5 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.INSP_MEMO					, 300+ 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.INDI_INSP_VM					, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.INDI_INSP_VA					, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.INDI_INSP_VC					, 10 + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.INSP_YMD						, 20 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.INSP_SAVE_YN					, 5  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.SMS_GMTR_MAN_YN				, 5  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.NONPAY_MANAGE_SEC			, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.SMS_CP_DDD					, 5  + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.SMS_CP_EXN					, 5  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.SMS_CP_NUM					, 5  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.COMPENS_REMOVE_ALARM		    , 1  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.MTR_DIGIT_CNT  		        , 1  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.SELF_GMTR_STR_YMD  		    , 8  + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.SELF_GMTR_END_YMD  		    , 8  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.BEFO_GMTR_SMS_YN  		    , 2  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.GMTR_MANAGE_STS  		    , 2  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.DEADLINE_CHG_YN  		    , 1  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.COMPENS_REMOVE_ALARM_2  		, 1  + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.INST_PLACE_NUM      		    , 9  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.OLD_COMPENS_REMOVE_ALARM_2  	, 1  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.PHOTO_MTR_YN  	    	    , 1  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.PHOTO_COMPENS_VC_YN  	   	, 1  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.PHOTO_COMPENS_VA_YN  	   	, 1  + 1, DECRYPT );
			
			sql->GetValue( sql, i++, 'U', (long*) stGm.PHOTO_COMPENS_VM_YN  	   	, 1  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.GUM_TYPE  	   	            , 1  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.USE_CONT_STS_CD     	     	, 2  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.REMOTE_GMTR_YN    	     	, 2  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.RECENT_INDI_MTR_MM_VC    	, 10 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.RECENT_GMTR_JOB_YMD		 	, 8  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.RECENT_GMTR_JOB_YMD_YEAR 	, 6  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.RECENT_GMTR_JOB_YMD_MONTHS 	, 4  + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) stGm.RECENT_GMTR_JOB_YMD_DAYS 	, 4  + 1, DECRYPT );
			sql->GetValue(sql, i++,  'U', (long *)stGm.DISC_CUST_YN, 2 + 1, DECRYPT);
			
		}
		else
		{
			PRINT("::sql->Next fail [%s]",sql->GetLastError(sql),0,0);
			goto Finally;
		}

Finally:
		DelSqLite(sql);

		// 계약상태 해지면 고객명, 전화번호, 생년월일 안보이도록 수정
		if( Str_Cmp(stGm.USE_CONT_STS_CD, "30") == 0 )
		{
			Mem_Set((byte *)stGm.CUST_NM, 0x00, sizeof(stGm.CUST_NM));
			Str_Cpy( stGm.CUST_NM, "" );
			
			Mem_Set((byte *)stGm.CP_DDD, 0x00, sizeof(stGm.CP_DDD));
			Str_Cpy( stGm.CP_DDD, "" );
			
			Mem_Set((byte *)stGm.CP_EXN, 0x00, sizeof(stGm.CP_EXN));
			Str_Cpy( stGm.CP_EXN, "" );
			
			Mem_Set((byte *)stGm.CP_NUM, 0x00, sizeof(stGm.CP_NUM));
			Str_Cpy( stGm.CP_NUM, "" );
			
			Mem_Set((byte *)stGm.OWNHOUSE_TEL_DDD, 0x00, sizeof(stGm.OWNHOUSE_TEL_DDD));
			Str_Cpy( stGm.OWNHOUSE_TEL_DDD, "" );
			
			Mem_Set((byte *)stGm.OWNHOUSE_TEL_EXN, 0x00, sizeof(stGm.OWNHOUSE_TEL_EXN));
			Str_Cpy( stGm.OWNHOUSE_TEL_EXN, "" );
			
			Mem_Set((byte *)stGm.OWNHOUSE_TEL_NUM, 0x00, sizeof(stGm.OWNHOUSE_TEL_NUM));
			Str_Cpy( stGm.OWNHOUSE_TEL_NUM, "" );
			
			Mem_Set((byte *)stGm.SOC_NUM, 0x00, sizeof(stGm.SOC_NUM));
			Str_Cpy( stGm.SOC_NUM, "" );
		}
		
		return;
	}
	
	/*=======================================================================================
	함수명 : REDRAW
	기  능 : 검침 자료를 읽어와서 화면에 설정한다.
	Param  : 
	Return : 
	========================================================================================*/
	void REDRAW(void)
	{
		long i;
		long lAddr = 0;
		long lEndDate, lToDate;
		char szToday[20];
		long cnt = 0;
		char szTmp[200];
		char szTitle[200];
		char szSql[300];
		
		Mem_Set( (byte*)szToday, 0x00, sizeof(szToday) );
		Str_ItoA(Time_GetDate(), szToday, 10); //0502
		/*****************************************/
		/* 타이틀                                */
		/*****************************************/
		Mem_Set((byte *)szTitle, 0x00, sizeof(szTitle));
		
		Str_Cpy(szTitle, "[");
		
		Mem_Set((byte *)szTmp, 0x00, sizeof(szTmp));
		g_Sql_RetStr("SELECT PARAM1 FROM RCV_LOG WHERE GUBUN = '10'", 10, szTmp );
		
		Str_Cat(szTitle, szTmp);
		
		Mem_Set((byte *)szTmp, 0x00, sizeof(szTmp));		
		g_Sql_RetStr("SELECT PARAM2 FROM RCV_LOG WHERE GUBUN = '10'", 5, szTmp );
		
		Str_Cat(szTitle, "/");
		Str_Cat(szTitle, szTmp);
		Str_Cat(szTitle, "]");
		
		if( Str_Cmp( stGm.GUM_TYPE, "20" ) == 0 )
		{
			Str_Cat(szTitle, " 재검 등록");
		}
		else
		{
			Str_Cat(szTitle, " 조정 에러 등록");
		}
		
		EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_TITLE), szTitle);
		
		/*****************************************/
		/* 현재페이지를 표시                     */
		/*****************************************/
		Mem_Set((byte *)m_szCnt_index, 0x00, sizeof(m_szCnt_index));
		SPRINT(m_szCnt_index, "%d/%d", g_nActIndex+1, m_ltotcnt, 0);
		
		/*****************************************/
		/* 날짜(일) 표시                         */
		/*****************************************/
		EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA2), stGm.BASE_YMD);
		
		/*****************************************/
		/* 요금용도                              */
		/*****************************************/
	    EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA5), stGm.PROD_CD);
		
		/*****************************************/
		/* 고객성향                              */
		/*****************************************/
        if(Str_Cmp(stGm.CUST_TRND_YN, "Y") == 0)
        {
        	EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA97), RED);
        }
        else
        {
        	EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA97), GREEN);
        }
		
		/*****************************************/
		/* 검침송달여부                          */
		/*****************************************/
        if(Str_Cmp(stGm.GMETER_SEND_YN, "Y") == 0)
        {
        	EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA98), RED);
        }
        else
        {
        	EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA98), GREEN);
        }
		
		/*****************************************/
		/* 검침 실사 여부                        */
		/*****************************************/
        if(Str_Cmp(stGm.INSP_YN, "Y") == 0)
        {
        	ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_SILSA), RED);
        }
        else
        {
        	ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_SILSA), BTNMENUFRCOLOR);
        }
		
		/*****************************************/
		/* EBPP구분                              */
	  	/* EBPP_FLAG = Y [메일]					 */
  		/* EBPP_FLAG = L [LMS]					 */
  		/* EBPP_FLAG = M [모바일]				 */
        /* 이외          []						 */						
        /*****************************************/
		if( Str_Cmp(stGm.EBPP_FLAG, "Y") == 0 )
		{
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA8), "메일");
			EditCtrl_SetForeColorEx(Get_hDlgCtrlByID(TXT_DATA8), RED);
		}
		else if( Str_Cmp(stGm.EBPP_FLAG, "L") == 0 )
		{
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA8), "LMS");
			EditCtrl_SetForeColorEx(Get_hDlgCtrlByID(TXT_DATA8), RED);
		}
		else if( Str_Cmp(stGm.EBPP_FLAG, "M") == 0 )
		{
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA8), "모바일");
			EditCtrl_SetForeColorEx(Get_hDlgCtrlByID(TXT_DATA8), RED);
		}
		else
		{
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA8), "");
		}
		
		/*****************************************/
		/* 검침월구분                            */
		/*****************************************/
		if(Str_Cmp(stGm.GMTR_YM_FLAG, "20") == 0)
		{
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA4), "짝");
		}
		else if(Str_Cmp(stGm.GMTR_YM_FLAG, "30") == 0)
		{
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA4), "홀");
		}
		else if(Str_Cmp(stGm.GMTR_YM_FLAG, "21") == 0)
		{
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA4), "격짝");
		}
		else if(Str_Cmp(stGm.GMTR_YM_FLAG, "31") == 0)
		{
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA4), "격홀");
		}
		else
		{
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA4), "매");
		}
		
		/*****************************************/
 		/* 계량기위치구분                        */
 		/*****************************************/
        if(Str_Cmp(stGm.MTR_LOC_FLAG, "10") == 0)
        {
        	EditCtrl_SetForeColorEx(Get_hDlgCtrlByID(TXT_DATA99), BLUE);
        	EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA99), "내부");
        }
        else
        {
        	EditCtrl_SetForeColorEx(Get_hDlgCtrlByID(TXT_DATA99), RED);
        	EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA99), "외부");
        }
        
        /*****************************************/
		/* 요금 버튼                             */
		/*****************************************/
        if(Str_AtoI(stGm.MONITOR_FLAG) >= 10 )
        {
        	ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_FEE), THEBLUE);
        }
        else
        {
        	ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_FEE), BTNCTRLBKCOLOR);
        }
		
		/*******************************************************************************/
		/* 삭제 버튼																   */
		/* SEND_YN(송신여부로 판단, I, S, N)										   */
		/* 검침결과가 있으면 취소 red -> S, I(I는 순수미검침 대상이 저장됬을때의 flag) */
		/* 검침결과가 없으며 삭제 darkturquoise -> N                                   */
		/*******************************************************************************/
        if((Str_Cmp(stGm.SEND_YN, "S") == 0 || Str_Cmp(stGm.SEND_YN, "I") == 0) || Str_Cmp(stGm.MTR_WORK_CODE, "L") == 0 )
        {
        	ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_DELETE), RED);
        	ButCtrl_SetText(Get_hDlgCtrlByID(BID_DELETE), "취소");
        }
        else 
        {
        	ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_DELETE), BTNCTRLBKCOLOR);
        	ButCtrl_SetText(Get_hDlgCtrlByID(BID_DELETE), "삭제");

        }
		
		/*****************************************/
		/* 메모정보유무체크                      */
		/*****************************************/
		if(Str_Len(stGm.RMK) > 0 || Str_Len(stGm.CHK_MEMO) > 0 )
		{
			ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MEMO), RED);
		}
		else
		{
			ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MEMO), BTNMENUFRCOLOR);
		}
		
		/*****************************************/	
		/* 점검버튼                              */
		/*****************************************/	
		if(Str_AtoI(stGm.GCHK_FLAG) == 20)
		{
			ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_SC), RED);
		}
		else
		{
			ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_SC), BTNMENUFRCOLOR);
		}
		
		/*****************************************/	
		/* 기물 버튼                             */
		/*****************************************/	
		if( Str_Cmp(stGm.SUPPLY_STS_CD, "정상") == 0 || Str_Cmp(stGm.SUPPLY_STS_CD, "해지") == 0  || Str_Len(stGm.SUPPLY_STS_CD) == '0')
		{
			EditCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_ADDR4), BTNMENUFRCOLOR);
		}
		else
		{
			EditCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_ADDR4), RED);
		}
		
		/**************************************************/	
		/* 고객버튼                                       */  
		/* 중지상태이거나, 임시고객일때 고객버튼 색이 RED */
		/**************************************************/
		if( Str_Cmp(stGm.CNL_YMD, "99991231") != 0 || stGm.CUST_NUM[0] == '0' || Str_Cmp(stGm.SUPPLY_STS_CD, "중지") == 0 )
		{
			ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_CLIENT), RED);
		}
		else
		{
			ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_CLIENT), BTNCTRLBKCOLOR);
		}
		
		/**************************************************/
		/* 주소											  */
		/**************************************************/
		Mem_Set((byte *)szAddr, 0x00, sizeof(szAddr));
		
		// 지번
		if( g_nAddrFlag == 0)
		{
			ButCtrl_SetText(Get_hDlgCtrlByID(BID_ADDR1), "지번");
			
			if(Str_Len(stGm.TOWN) > 0)
			{
				Str_Cpy(szAddr,  stGm.TOWN );
			}
			else
			{
				Str_Cpy(szAddr,  "" );
			}
			
			if(Str_Len(stGm.VILLAGE) > 0)
			{
				Str_Cat(szAddr,  " " );
				Str_Cat(szAddr,  stGm.VILLAGE );
			}
			
			if(Str_Len(stGm.ADDR1_M) > 0)
			{
				Str_Cat(szAddr,  " " );
				Str_Cat(szAddr,  stGm.ADDR1_M);
			}
			
			if(Str_Len(stGm.ADDR1_S) > 0)
			{
				Str_Cat(szAddr,  "-" );
				Str_Cat(szAddr,  stGm.ADDR1_S);
			}
			
			lAddr = Str_Len(stGm.CO_LIVE_NM) + Str_Len(stGm.BLD_NM);

			if( lAddr > 0 )
			{
				if( Str_Len(stGm.CO_LIVE_NM) > 0 )
				{
					Str_Cat(szAddr,  " " );
					Str_Cat(szAddr,  stGm.CO_LIVE_NM );
				}
				else
				{
					Str_Cat(szAddr,  "" );
				}
				
				if( Str_Len(stGm.BLD_NM) > 0 )
				{
					Str_Cat(szAddr,  " " );	
					Str_Cat(szAddr,  stGm.BLD_NM );
				}
				
				if( Str_Len(stGm.HOSU) > 0 )
				{
					Str_Cat(szAddr,  "-" );	
					Str_Cat(szAddr,  stGm.HOSU );
				}
				
				if( Str_Len(stGm.DETA_FLOOR) > 0 )
				{
					Str_Cat(szAddr,  " " );	
					Str_Cat(szAddr,  stGm.DETA_FLOOR );
				}
			}
			else
			{
				if( Str_Len(stGm.HOSU) > 0 )
				{
					Str_Cat(szAddr,  " " );
					Str_Cat(szAddr,  stGm.HOSU );
				}
				else
				{
					Str_Cat(szAddr,  "" );
				}
				
				if( Str_Len(stGm.DETA_FLOOR) > 0 )
				{
					Str_Cat(szAddr,  " " );	
					Str_Cat(szAddr,  stGm.DETA_FLOOR );
				}
			}
			
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA3), szAddr);
		}
		// 도로명
		else
		{
			ButCtrl_SetText(Get_hDlgCtrlByID(BID_ADDR1), "도로명");
			
			if(Str_Len(stGm.NEW_ROAD_NM) > 0)
			{
				Str_Cpy(szAddr,  stGm.NEW_ROAD_NM );
			}
			else
			{
				Str_Cpy(szAddr,  "" );
			}
			
			if(Str_Len(stGm.NEW_ADDR_M) > 0)
			{
				Str_Cat(szAddr,  " " );
				Str_Cat(szAddr,  stGm.NEW_ADDR_M);
			}
			
			if(Str_Len(stGm.NEW_ADDR_S) > 0)
			{
				Str_Cat(szAddr,  "-" );
				Str_Cat(szAddr,  stGm.NEW_ADDR_S);
			}

			if( Str_Len(stGm.CO_LIVE_NM) > 0 )
			{
				Str_Cat(szAddr,  " " );
				Str_Cat(szAddr,  stGm.CO_LIVE_NM );
			}
			else
			{
				Str_Cat(szAddr,  "" );
			}
			
			if( Str_Len(stGm.BLD_NM) > 0 )
			{
				Str_Cat(szAddr,  " " );	
				Str_Cat(szAddr,  stGm.BLD_NM );
			}
			
			if( Str_Len(stGm.HOSU) > 0 )
			{
				Str_Cat(szAddr,  "-" );	
				Str_Cat(szAddr,  stGm.HOSU );
			}
			
			if( Str_Len(stGm.DETA_FLOOR) > 0 )
			{
				Str_Cat(szAddr,  " " );
				Str_Cat(szAddr,  stGm.DETA_FLOOR );		//세부층
			}
			
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA3), szAddr);
		}
		
		/**************************************************/
		/* 고객명&상호명 토글 , m_lNameFlag               */
		/**************************************************/
		Mem_Set( (byte*)m_szName, 0x00, sizeof(m_szName) );
		
		if( g_nNameFlag == 0 )
		{
			ButCtrl_SetText(Get_hDlgCtrlByID(BID_ADDR2), "상호");
			
			if( Str_Cmp( stGm.FIRM_NM, "" ) == 0 )
			{
				Str_Cpy(m_szName, stGm.CUST_NM);
			}
			else
			{
				Str_Cpy(m_szName, stGm.FIRM_NM);
				
				if( Str_Cmp( stGm.CUST_NM, "" ) != 0 )
				{
					Str_Cat(m_szName, "/");
					Str_Cat(m_szName, stGm.CUST_NM);
				}
			}
			
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA7), m_szName );
		}
		else
		{
			ButCtrl_SetText(Get_hDlgCtrlByID(BID_ADDR2), "건물");
				
			if( Str_Cmp( stGm.BLD_NM, "" ) == 0 )
			{
				Str_Cpy(m_szName, stGm.CUST_NM);
			}
			else
			{
				Str_Cpy(m_szName, stGm.BLD_NM);
				
				if( Str_Cmp( stGm.CUST_NM, "" ) != 0 )
				{
					Str_Cat(m_szName, "/");
					Str_Cat(m_szName, stGm.CUST_NM);
				}
			}
			
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA7), m_szName );
		}
		
		/**************************************************/
		/* 기물번호                                       */
		/**************************************************/
		ButCtrl_SetText(Get_hDlgCtrlByID(BID_MTR_ID_NUM), stGm.MTR_ID_NUM); 
		
		/**************************************************/
		/* 핸드폰&집전화번호 토글 , m_lPhoneflag          */
		/**************************************************/
		Mem_Set((byte *)m_szPhone, 0x00, sizeof(m_szPhone));
		
		// HP
		if( g_nTelFlag == 0 )
		{
			ButCtrl_SetText(Get_hDlgCtrlByID(BID_ADDR5), "HP");
		
			Str_Cpy(m_szPhone,  stGm.CP_DDD );
			Str_Cat(m_szPhone,  "-" );
			
			if(Str_Len(stGm.CP_EXN) == 0)
			{
				Str_Cat(m_szPhone,  " " );	
			}
			else
			{
				Str_Cat(m_szPhone,  stGm.CP_EXN);
			}
			
			Str_Cat(m_szPhone,  "-" );

			if(Str_Len(stGm.CP_NUM) == 0)
			{
				Str_Cat(m_szPhone,  " " );	
			}
			else
			{
				Str_Cat(m_szPhone,  stGm.CP_NUM);
			}
			
			ButCtrl_SetText(Get_hDlgCtrlByID(BID_TEL), m_szPhone);
			
			if( Str_Len(m_szPhone) > 10)
			{
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_TEL), TRUE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_TEL), FALSE );
			}
			else
			{
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_TEL), FALSE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_TEL), TRUE );
			}
		}
		// TEL
		else
		{
			ButCtrl_SetText(Get_hDlgCtrlByID(BID_ADDR5), "TEL");
		
			Str_Cpy(m_szPhone,  stGm.OWNHOUSE_TEL_DDD );
			Str_Cat(m_szPhone,  "-" );
			
			if(Str_Len(stGm.OWNHOUSE_TEL_EXN) == 0)
			{
				Str_Cat(m_szPhone,  " " );	
			}
			else
			{
				Str_Cat(m_szPhone,  stGm.OWNHOUSE_TEL_EXN);
			}
			
			Str_Cat(m_szPhone,  "-" );
			
			if(Str_Len(stGm.OWNHOUSE_TEL_NUM) == 0)
			{
				Str_Cat(m_szPhone,  " " );	
			}
			else
			{
				Str_Cat(m_szPhone,  stGm.OWNHOUSE_TEL_NUM);
			}
			
			ButCtrl_SetText(Get_hDlgCtrlByID(BID_TEL), m_szPhone);
			
			if( Str_Len(m_szPhone) > 10)
			{
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_TEL), TRUE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_TEL), FALSE );
			}
			else
			{
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_TEL), FALSE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_TEL), TRUE );
			}
		}
		
		/**********************************************************************/
		/* MONITOR_FLAG >= 10 일때, 전월라인 색 변경, 전월/전전월 데이터 입력 */
		/**********************************************************************/
		/**************************************************/
		/* 화면 Data Setting                              */
		/**************************************************/
		// 계량기
		if( 10 == m_lUserData )
		{
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA14), stGm.MTR_CHG_YMD );
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA17), stGm.BEFO_GMTR_CD_1 );
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA18), stGm.BEFO_MM_INDI_COMPENS_VC_1 );
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA19), stGm.BEFO_MM_USE_QTY_1 );
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA20), stGm.BEFO_GMTR_CD_2 );
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA21), stGm.BEFO_MM_INDI_COMPENS_VC_2 );
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA22), stGm.BEFO_MM_USE_QTY_2 );
			
			if( Str_Cmp(stGm.BEFO_MM_INDI_COMPENS_VC_1, stGm.BEFO_MM_INDI_COMPENS_VC_2) == 0 && 
			    Str_Cmp(stGm.BEFO_MM_INDI_COMPENS_VC_1, stGm.BEFO_MM_INDI_COMPENS_VC_3) == 0)
			{
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA11), BRIGHTPINK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA17), BRIGHTPINK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA18), BRIGHTPINK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA19), BRIGHTPINK);
				
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA16), TXTINCTRLBK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA20), TXTINCTRLBK);
			}
			else
			{
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA11), TXTINCTRLBK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA17), TXTINCTRLBK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA18), TXTINCTRLBK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA19), TXTINCTRLBK);
				
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA16), TXTINCTRLBK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA20), TXTINCTRLBK);
			}
		}
		// 보정기
		else if( 20 == m_lUserData )
		{
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA17), stGm.BEFO_GMTR_CD_1 );
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA18), stGm.BEFO_MM_INDI_COMPENS_VC_1 );
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA19), stGm.BEFO_MM_INDI_COMPENS_VA_1 );
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA20), stGm.BEFO_MM_INDI_MTR_1 );
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA21), stGm.BEFO_GMTR_CD_2 );
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA22), stGm.BEFO_MM_INDI_COMPENS_VC_2 );
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA23), stGm.BEFO_MM_INDI_COMPENS_VA_2 );
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA24), stGm.BEFO_MM_INDI_MTR_2 );

			if( Str_Cmp(stGm.BEFO_MM_INDI_COMPENS_VC_1, stGm.BEFO_MM_INDI_COMPENS_VC_2) == 0 && 
			    Str_Cmp(stGm.BEFO_MM_INDI_COMPENS_VC_1, stGm.BEFO_MM_INDI_COMPENS_VC_3) == 0)
			{
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA11), BRIGHTPINK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA17), BRIGHTPINK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA18), BRIGHTPINK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA19), BRIGHTPINK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA20), BRIGHTPINK);

				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA16), TXTINCTRLBK);
			}
			else
			{
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA11), TXTINCTRLBK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA17), TXTINCTRLBK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA18), TXTINCTRLBK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA19), TXTINCTRLBK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA20), TXTINCTRLBK);

				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA16), TXTINCTRLBK);
			}
		}
		// 온도, 온압보정기
		else
		{
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA16), stGm.BEFO_GMTR_CD_1 );
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA17), stGm.BEFO_MM_INDI_COMPENS_VC_1 );
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA18), stGm.BEFO_MM_INDI_MTR_1 );
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA19), stGm.BEFO_GMTR_CD_2 );
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA20), stGm.BEFO_MM_INDI_COMPENS_VC_2 );
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA21), stGm.BEFO_MM_INDI_MTR_2 );

			if( Str_Cmp(stGm.BEFO_MM_INDI_COMPENS_VC_1, stGm.BEFO_MM_INDI_COMPENS_VC_2) == 0 && 
			    Str_Cmp(stGm.BEFO_MM_INDI_COMPENS_VC_1, stGm.BEFO_MM_INDI_COMPENS_VC_3) == 0)
			{
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA11), BRIGHTPINK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA16), BRIGHTPINK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA17), BRIGHTPINK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA18), BRIGHTPINK);

				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA19), TXTINCTRLBK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA20), TXTINCTRLBK);
			}
			else
			{
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA11), TXTINCTRLBK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA16), TXTINCTRLBK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA17), TXTINCTRLBK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA18), TXTINCTRLBK);

				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA19), TXTINCTRLBK);
				EditCtrl_SetBkColorEx(Get_hDlgCtrlByID(TXT_DATA20), TXTINCTRLBK);
			}
		}
		
		/*****************************************************/	
		/* 보정기 삭제 대상에 따른 기물번호 TXT, BTN SETTING */
		/*****************************************************/
		// 1. 전달 서명을 받았으면 노란색
		// 2. 전달 서명을 받지 않아으며 고장이면 빨간색
		// 3, 정상이면 흰색
		if( Str_Cmp( stGm.OLD_COMPENS_REMOVE_ALARM_2, "Y" ) == 0 )
		{
			ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_MTR_ID_NUM), YELLOW);
    		ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MTR_ID_NUM), TXTFRCOLOR);
		}
		else
		{
			if( Str_Cmp( stGm.COMPENS_REMOVE_ALARM_2, "Y" ) == 0 )
			{
				ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_MTR_ID_NUM), RED);
	    		ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MTR_ID_NUM), BTNMENUFRCOLOR);
			}
			else
			{
				ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_MTR_ID_NUM), TXTINCTRLBK);
	    		ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MTR_ID_NUM), TXTFRCOLOR);
			}
		}		
			
		/**************************************************/
		/* 화면 Data Setting                              */
		/**************************************************/
		// 화면 최초 접근시 화면 표기
		if( g_lDataflag == 0)
		{
			// 계량기
			if( 10 == m_lUserData )
			{
				if(stGm.SEND_YN[0] == 'N' || stGm.SEND_YN[0] == '')
				{
					if( Str_Len(g_szMtr_Code) > 0 )
					{
						Mem_Set( (byte*)stGm.MTR_WORK_CODE, 0x00, sizeof(stGm.MTR_WORK_CODE) );
						Str_Cpy(stGm.MTR_WORK_CODE, g_szMtr_Code);
					}
				}
			}
			
			i = SearchCD( stGm.MTR_WORK_CODE, RE_GM_CODE );
			
			if (i == -1)
			{
				EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), RE_GM_CODE[0].Str);
			}
			else
			{
				EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), RE_GM_CODE[i].Str);
			}
			
			// 부재, 없음, 사후문자
			if( Str_Cmp(stGm.MTR_WORK_CODE,"2") == 0 || Str_Cmp(stGm.MTR_WORK_CODE,"C") == 0 || Str_Cmp(stGm.MTR_WORK_CODE,"L") == 0 )
			{
				// 계량기
				if( 10 == m_lUserData )
				{
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );

					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "" );
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), "" );	
				}
				// 보정기
				else if( 20 == m_lUserData )
				{
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), FALSE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );

					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), "" );
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VA), "" );
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "" );
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), "");
				}
				// 온도, 온압보정기
				else
				{	
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );

					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), "" );
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "" );
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), "");
				}
				
				// 부재인 경우 메세지 RED
				if( Str_Cmp(stGm.MTR_WORK_CODE,"2") == 0 )
				{
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), RED);
				}
				else
				{
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);
				}
			}
			// 부재, 없음, 사후문자 이외
			else
			{
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), FALSE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
				
				ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);
				
				// 자가검침 세대가 아닌 경우
				if( Str_Cmp(stGm.SELF_GMTR_YN, "Y") != 0 )
				{
					Dialog_SetActiveCtrl(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC) );
					m_lEditCtrlIndex = Dialog_GetActiveCtrlIndex(this->m_hDlg);
				}
				// 자가검침 세대인 경우
				else
				{
					lToDate = Time_GetDate();
					lEndDate = Str_AtoI( stGm.SELF_GMTR_END_YMD );
					
					if( lEndDate > 0 && ( lToDate > lEndDate ) && Str_Cmp(stGm.GMTR_MANAGE_STS, "70") != 0 )
					{
						Dialog_SetActiveCtrl(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC) );
						m_lEditCtrlIndex = Dialog_GetActiveCtrlIndex(this->m_hDlg);
					}
				}
				
				// 계량기
				if( 10 == m_lUserData )
				{
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), stGm.INDI_SET_VC );
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), stGm.INDI_QTY );
				}
				// 보정기
				else if( 20 == m_lUserData )
				{
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), stGm.INDI_SET_VM );
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VA), stGm.INDI_SET_VA );
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), stGm.INDI_SET_VC );
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), stGm.INDI_QTY);
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), stGm.INDI_QTY);
				}
				// 온도, 온압보정기
				else
				{	
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), stGm.INDI_SET_VM );
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), stGm.INDI_SET_VC );
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), stGm.INDI_QTY);
				}
			}
		}
		// 최초 접근 이외에 화면 표기
		else
		{
			// 부재, 없음, 사후문자
			if( g_szIndi_MtrCode[0] == '2' || g_szIndi_MtrCode[0] == 'C' || g_szIndi_MtrCode[0] == 'L' )
			{
				// 계량기
				if( 10 == m_lUserData )
				{
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );

					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "" );
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), "" );
				}
				// 보정기
				else if( 20 == m_lUserData )
				{
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), FALSE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );

					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), "" );
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VA), "" );
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "" );
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), "");
				}
				// 온도, 온압 보정기
				else
				{	
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );

					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), "" );
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "" );
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), "");
				}
				
				// g_szIndi_MtrCode가 부재코드인 경우 메세지 RED
				if( g_szIndi_MtrCode[0] == '2' )
				{
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), RED);
				}
				else
				{
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);
				}
			}
			// 부재, 없음, 사후문자 이외
			else
			{
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), FALSE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
				
				ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);
				
				// 자가검침 세대가 아닌 경우
				if( Str_Cmp(stGm.SELF_GMTR_YN, "Y") != 0 )
				{
					Dialog_SetActiveCtrl(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC) );
					m_lEditCtrlIndex = Dialog_GetActiveCtrlIndex(this->m_hDlg);
				}
				// 자가검침 세대인 경우
				else
				{
					lToDate = Time_GetDate();
					lEndDate = Str_AtoI( stGm.SELF_GMTR_END_YMD );
					
					if( lEndDate > 0 && lToDate > lEndDate && Str_Cmp(stGm.GMTR_MANAGE_STS, "70") != 0 )
					{
						Dialog_SetActiveCtrl(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC) );
						m_lEditCtrlIndex = Dialog_GetActiveCtrlIndex(this->m_hDlg);
					}
				}
				
				// 계량기
				if( 10 == m_lUserData )
				{
					EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), g_szIndi_MtrCode );
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), g_szIndi_Vc );
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), g_szIndi_Qty );
				}
				//보정기
				else if( 20 == m_lUserData )
				{
					EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), g_szIndi_MtrCode );
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), g_szIndi_Vm );
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VA), g_szIndi_Va );
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), g_szIndi_Vc );
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), g_szIndi_Qty );
				}
				//온도, 온압 보정기
				else
				{	
					EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), g_szIndi_MtrCode );
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), g_szIndi_Vm );
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), g_szIndi_Vc );
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), g_szIndi_Qty );
				}
			}
		}
		
		m_maxQtySaveCnt = 0;
		
		// 화면 draw 후 해당 메시지 출력을 위해
		ON_DRAW();
		
		/**************************************************/
		/* 화면 draw 후 메세지 출력                       */
		/**************************************************/
		// 화면 최초 접근시 화면 표기
		if( g_lDataflag == 0 )
		{
			Mem_Set( (byte*)szToday, 0x00, sizeof(szToday) );
			Str_ItoA(Time_GetDate(), szToday, 10);
			// PRINT("111111111111111111111 :%s",szToday,0,0);
			// 자가검침 세대인 경우
			if( Str_Cmp(stGm.SELF_GMTR_YN, "Y") == 0 )
			{
				lToDate = Time_GetDate();
				lEndDate = Str_AtoI( stGm.SELF_GMTR_END_YMD );
				
				if (Str_Cmp(stGm.MTR_LOC_FLAG, "20") == 0 && lEndDate > 0 && (lEndDate > lToDate))
				{
					MessageBoxEx(CONFIRM_OK, "자가검침 기간이지만 계량기가 외부에 있어 PDA검침도 가능합니다.");

					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), FALSE );
					
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), FALSE );
					
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					
					DlgCtrl_SetEnable( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), TRUE);
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), FALSE );
					
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);	
				}
				else if( lEndDate > 0 && ( lToDate > lEndDate ) && Str_Cmp(stGm.GMTR_MANAGE_STS, "70") != 0 )
				{
					MessageBoxEx(CONFIRM_OK, "자가검침세대이지만\n등록기간이 경과되어\nPDA검침이 가능합니다.");
					
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), FALSE );
					
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), FALSE );
					
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					
					DlgCtrl_SetEnable( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), TRUE);
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), FALSE );
					
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
				}
				else if(Str_Cmp(stGm.MTR_LOC_FLAG, "10") == 0  && Str_Cmp(stGm.GMTR_JOB_YMD_END,szToday) == 0 )
				{
					MessageBoxEx(CONFIRM_OK, "자가검침 기간이지만 \n 계량기가 내부에 있고 \n 금일 검침종료일이라 PDA검침이 가능합니다.");
					// 20190129_마감일변경 개선
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), FALSE );
					
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), FALSE );
					
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					
					DlgCtrl_SetEnable( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), TRUE);
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), FALSE );
					
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
				}
				else
				{
					// 20190129_마감일변경 개선
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), TRUE );
					
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), TRUE );
					
					DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
					
					DlgCtrl_SetEnable( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), FALSE);
					DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), TRUE );
					
					if( Str_Cmp(stGm.GMTR_MANAGE_STS, "70") == 0 && Str_Cmp(stGm.DEADLINE_CHG_YN, "Y") == 0 && Str_Cmp(stGm.SELF_GMTR_YN, "Y") == 0)
					{
						EditCtrl_SetStr( Get_hDlgCtrlByID(CMB_RESULT), "마감변경" );
						MessageBoxEx(CONFIRM_OK, "마감일변경세대는 입력불가합니다.");
					}
					else
					{
						EditCtrl_SetStr( Get_hDlgCtrlByID(CMB_RESULT), "자가검침" );
						MessageBoxEx(CONFIRM_OK, "자가검침세대는 입력불가합니다.");
					}
					
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
				}
			}
			// 원격 검침 세대인 경우
			else if( Str_Cmp(stGm.REMOTE_GMTR_YN, "Y") == 0 )
			{	
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(BID_REMOTE), TRUE);
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_REMOTE), "원격지침");
				BUTSETRANGE(Get_hDlgCtrlByID(BID_REMOTE),	STARTX+500, STARTY+345,  785, 510);	
				
				// if(Str_Cmp(stGm.GMTR_JOB_YMD_END,szToday) == 0 )
				// {
				// 	// EDT_VC
				// 	MessageBoxEx(CONFIRM_OK, "원격검침 세대이지만 \n 금일 검침종료일이라 PDA검침이 가능합니다.");
					
				// 	// EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), GM_CODE[14].Str);
				// 	// EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), stGm.RECENT_INDI_MTR_MM_VC);

				// 	DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
				// 	DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );

				// 	DlgCtrl_SetEnable( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), TRUE);
				// 	DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), FALSE );	

				// 	// DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(BID_REMOTE), FALSE);
					
				// 	DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), TRUE );
				// 	DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), FALSE );

				// 	DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), TRUE );
				// 	DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), FALSE );
				// }
				// else
				// {
				// 	//EDT_VC 값 입력해줘야함.
				// 	// MessageBoxEx(CONFIRM_OK, "원격검침 세대이지만 \n 금일 검침종료일이라 PDA검침이 가능합니다.");
				// 	MessageBoxEx(CONFIRM_OK, "원격검침 세대는 입력불가합니다. ");	

				// 	// EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), GM_CODE[14].Str);
				// 	EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), "R:원격");

				// 	DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
				// 	DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );

				// 	EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), stGm.RECENT_INDI_MTR_MM_VC);

				// 	DlgCtrl_SetEnable( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), FALSE);
				// 	DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), TRUE );

				// 	DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), FALSE );
				// 	DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), TRUE );

				// 	DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), FALSE );
				// 	DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), TRUE );

				// 	// Cal_UseQty( stGm.RECENT_INDI_MTR_MM_VC );

				// 	// DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(BID_REMOTE), TRUE);
				// 	// ButCtrl_SetText(Get_hDlgCtrlByID(BID_REMOTE), "원격지침");
				// 	// BUTSETRANGE(Get_hDlgCtrlByID(BID_REMOTE),	STARTX+500, STARTY+345,  785, 510);	

				// 	// Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);	

				// }
			}
			// 자가검침 세대가 아닌 경우
			else
			{
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), TRUE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), FALSE );
				
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), TRUE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), FALSE );
				
				DlgCtrl_SetEnable( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), TRUE);
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), FALSE );

				Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
			}
			
			// 2017.10.30 신기호 전산철거 알람 추가
			if( Str_Cmp(stGm.COMPENS_REMOVE_ALARM, "Y") == 0 )
			{
				MessageBoxEx(CONFIRM_OK, "온압보정기 전산철거 세대입니다.");
			}
		}
		
		return;
	}

	/*=======================================================================================
	함수명 : Prev_Gm
	기  능 : 이전 버튼시 이전대상을 찾는다.
	Param  : 
	Return : 
	========================================================================================*/
	void Prev_Gm(void)
	{
		long lToDate, lEndDate;
		
		if( g_nActIndex > 0 )
		{
			g_nActIndex--;
			g_lindex = g_SREACHFILE_GetSeq(SREACH_FILE, g_nActIndex);
		}
		else
		{
			g_nActIndex = -1;
		}
		
		if( g_nActIndex < 2 )
		{	
			//검색 후, 첫번째 고객 메세지 박스 변수
			m_lPrev--;
		}

		if( g_lindex <= 0 || g_nActIndex < 0 )
		{
			g_nActIndex = 0;
			g_lindex = g_SREACHFILE_GetSeq(SREACH_FILE, g_nActIndex);

			if( m_lPrev < 0 )
			{
				m_lPrev = 0;
			}
			return;
		}
		
		Clear_Flag();
		SetData();
		SetStyle();
		REDRAW();
		
		if( Str_Cmp(stGm.SMS_GMTR_MAN_YN, "Y") == 0 || Str_Cmp(stGm.BEFO_GMTR_SMS_YN, "Y") == 0 )
		{
			DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(BID_SMS_STS), TRUE);
			ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_SMS_STS), RED);
			Rcv_SmsSts();
		}
		else
		{
			ButCtrl_SetText(Get_hDlgCtrlByID(BID_SMS_STS), "");
			ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_SMS_STS), BTNMENUFRCOLOR);
			DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(BID_SMS_STS), FALSE);
			
			if( Str_Cmp(stGm.SELF_GMTR_YN, "Y") == 0 )
			{
				/*
				lToDate = Time_GetDate();
				lEndDate = Str_AtoI( stGm.SELF_GMTR_END_YMD );

				if( lToDate <= lEndDate )
				{
					Rcv_self_select();
				}
				*/
				Rcv_self_select();
			}
		}
		ON_DRAW();
		return;
	}
	
	/*=======================================================================================
	함수명 : Next_Gm
	기  능 : 다운 버튼시 다음대상을 찾는다.
	Param  : 
	Return : 
	========================================================================================*/
	void Next_Gm(void)
	{
		long lToDate, lEndDate;
		
		m_lPrev = 0;

		g_nActIndex++;
		g_lindex = g_SREACHFILE_GetSeq(SREACH_FILE, g_nActIndex);

		if( g_nActIndex > m_ltotcnt || g_lindex < 0 )
		{
			if( g_SREACHFILE_GetSeq(SREACH_FILE, g_nActIndex) < g_nActIndex )
			{
				g_nActIndex = g_nActIndex-1;
			}
			g_lindex = g_SREACHFILE_GetSeq(SREACH_FILE, g_nActIndex);
			
			Clear_Flag();
			SetData();
			SetStyle();
			REDRAW();
			
			if( m_lLastSave > 0 )
			{
				Rcv_SmsSts();
			}
			
			MessageBoxEx (CONFIRM_OK, "마지막 고객입니다.");
			
			ON_DRAW();
			return;
		}

		Clear_Flag();
		SetData();
		SetStyle();
		REDRAW();

		if( Str_Cmp(stGm.SMS_GMTR_MAN_YN, "Y") == 0 || Str_Cmp(stGm.BEFO_GMTR_SMS_YN, "Y") == 0 )
		{
			DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(BID_SMS_STS), TRUE);
			ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_SMS_STS), RED);
			Rcv_SmsSts();
		}
		else
		{
			ButCtrl_SetText(Get_hDlgCtrlByID(BID_SMS_STS), "");
			ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_SMS_STS), BTNMENUFRCOLOR);
			DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(BID_SMS_STS), FALSE);
			
			if( Str_Cmp(stGm.SELF_GMTR_YN, "Y") == 0 )
			{
				/*
				lToDate = Time_GetDate();
				lEndDate = Str_AtoI( stGm.SELF_GMTR_END_YMD );

				if( lToDate <= lEndDate )
				{
					Rcv_self_select();
				}
				*/
				
				Rcv_self_select();
			}
		}
		ON_DRAW();
		
		return;
	}
	
	/*=======================================================================================
	함수명 : Gm_ChkRule
	기  능 : 검침 체크 룰
	Param  : 
	Return : 
	========================================================================================*/
	bool Gm_ChkRule(void)
	{
		long nIndi_VC;			//당월 VC지침 
		long nIndi_VM;			//당월 VM지침 
		long nIndi_VA;			//당월 VA지침 
		long nIndi_Qty;
		long nBefo_Indi_VC_1;
		long nBefo_Indi_VM_1;
		long nBefo_Indi_VA_1;
		
		long nIndi_VMUse;
		long nIndi_VAUse;
		long nValue;
		long nRemain;
		long nhigh_v;
		long nlow_v;
		long nfactor_h;
		long nfactor_l;
		long nGmMgnfctn = 0;	//검침배율
		long nBefo_UseQty_1;
		long nBefo_UseQty_2;
		long nBefo_UseQty_3;
		long nBefo_UseQty;
		long nChk_Use;
		long nChk_Cnt;
		long idx=0;
		long i;
		long nChkplus1 = 0;
		long nChkplus2 = 0;
		long nChkplus3 = 0;
		
		char szIndi_VM[10];		//당월 VM 지침 
		char szIndi_VA[10];		//당월 VA지침 
		char szIndi_VC[10];		//당월 VC지침
		char szIndi_VCUse[10];
		char szIndi_VMUse[10];
		char szIndi_VAUse[10];
		
		//보정기지침이상 체크
		char szValue[10];		//나눗셈의 몫
		char szRemain[10];		//나눗셈의 나머지
		char szhigh_v[10];
		char szlow_v[10];
		char szMsg[20];
		char szStr1[300];
		char szDate[18];        //날짜 문자열
		char szTime[9];        	//시간 문자열
		char szSql[128];
		char sztmp[10];
		char strMsg1[100];
		long lEndDate, lToDate;
		
		/****************************************************/
		/* 최초 Mem_Set                    				    */
		/****************************************************/
		Mem_Set((byte *)szIndi_VM   , 0x00, sizeof(szIndi_VM));
		Mem_Set((byte *)szIndi_VA   , 0x00, sizeof(szIndi_VA));
		Mem_Set((byte *)szIndi_VC   , 0x00, sizeof(szIndi_VC));
		Mem_Set((byte *)szIndi_VCUse, 0x00, sizeof(szIndi_VCUse));
		Mem_Set((byte *)szIndi_VMUse, 0x00, sizeof(szIndi_VMUse));
		Mem_Set((byte *)szIndi_VAUse, 0x00, sizeof(szIndi_VAUse));
		Mem_Set((byte *)szValue		, 0x00, sizeof(szValue));
		Mem_Set((byte *)szRemain	, 0x00, sizeof(szRemain));
		Mem_Set((byte *)szhigh_v    , 0x00, sizeof(szhigh_v));
		Mem_Set((byte *)szlow_v     , 0x00, sizeof(szlow_v));
		Mem_Set((byte *)szMsg       , 0x00, sizeof(szMsg));
		Mem_Set((byte *)szStr1      , 0x00, sizeof(szStr1));
		
		/****************************************************/
		/* 날짜 Setting                    				    */
		/****************************************************/
		Mem_Set((byte *)szDate, 0x00, sizeof(szDate));
		Mem_Set((byte *)szTime, 0x00, sizeof(szTime));
		
		Str_ItoA(Time_GetDate(),szDate,10);
		g_Str_TimeType( szTime , Time_GetTime());
		Str_Cat(szDate, szTime);
		
		/****************************************************/
		/* 검침코드 콤보박스 스트링으로된 값을 코드로 변경  */
		/****************************************************/
		Mem_Set((byte *)m_szMtr_Code, 0x00, sizeof(m_szMtr_Code));
		
		i = SearchStr( EditCtrl_GetStr(Get_hDlgCtrlByID(CMB_RESULT)), RE_GM_CODE );
		if (i == -1)
		{
			Str_Cpy(m_szMtr_Code, "");
		}
		else
		{
			Str_Cpy(m_szMtr_Code, RE_GM_CODE[i].Code);
		}
		
		/****************************************************/
		/* 사전회신, 자가검침, 마감변경 저장 불가           */
		/****************************************************/
		if ( Str_Cmp( EditCtrl_GetStr(Get_hDlgCtrlByID(CMB_RESULT)), "사전회신" ) == 0 ||
		     Str_Cmp( EditCtrl_GetStr(Get_hDlgCtrlByID(CMB_RESULT)), "자가검침" ) == 0 ||
		     Str_Cmp( EditCtrl_GetStr(Get_hDlgCtrlByID(CMB_RESULT)), "마감변경" ) == 0 )
		{
			MessageBoxEx(CONFIRM_OK, "검침 코드를 선택해주세요.");
			
			return FALSE;	
		}
		
		/****************************************************/
		/* ETC에서 가져온 값인 같은 지침값 저장 불가        */
		/****************************************************/
		if ( Str_Cmp( EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)), m_szIndiVc ) == 0 )
		{
			MessageBoxEx(CONFIRM_OK, "입력하는 지침과 수신된 지침이 동일한 경우 검침코드 수정이 불가능합니다.");
			
			return FALSE;
		}
		
		/****************************************************/
		/* 자가검침 여부 체크								*/
		/****************************************************/
		if( Str_Cmp(stGm.SELF_GMTR_YN, "Y") == 0 )
		{
			lToDate = Time_GetDate();
			lEndDate = Str_AtoI( stGm.SELF_GMTR_END_YMD );

			if( ( lToDate <= lEndDate ) && Str_Cmp(stGm.GMTR_MANAGE_STS, "70") == 0 )
			{
				MessageBoxEx(CONFIRM_OK, "자가검침세대는 입력불가합니다.");
				
				Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
				Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
				
				return FALSE;
			}
		}
		
		/****************************************************/
		/* 모니터 구분 값이 있을 때 사용량 이상세대 창 팝업	*/
		/****************************************************/
		if( Str_AtoI(stGm.MONITOR_FLAG) >= 10 && m_lChk == 0 )
		{
			ON_EXIT();
			OnInit(INIT_USE);
			
			return FALSE;
		}
		
		/****************************************************/
		/* 2:부재, C:없음 인 경우							*/
		/****************************************************/
		if( Str_Cmp(m_szMtr_Code, "2") != 0 && Str_Cmp(m_szMtr_Code, "C") != 0 )
		{
			// 온도보정기 상시계수 입력 확인 
			if( (m_lUserData == 40 && Str_Len(stGm.CURR_TEMPER) == 0) ||
			    (m_lUserData == 40 && Str_Len(stGm.CURR_REVIS_PARA) == 0) )
			{
				MessageBoxEx(CONFIRM_OK, "온도보정계량기 상시계수 입력을 확인하세요.");
				ON_EXIT();
				OnInit(INIT_NUM);
				
				return FALSE;
			}
			
			// 온압보정기 상시계수 입력 확인 
			if( m_lUserData == 41 && Str_Len(stGm.CURR_TEMPER) == 0 ||
				m_lUserData == 41 && Str_Len(stGm.CURR_PRES) == 0 ||
				m_lUserData == 41 && Str_Len(stGm.CURR_REVIS_PARA) == 0 )
			{
				MessageBoxEx(CONFIRM_OK, "온압보정계량기 상시계수 입력을 확인하세요.");
				ON_EXIT();
				OnInit(INIT_NUM);
				
				return FALSE;
			}
			
			// 보정기 상시계수 입력 확인 
			if( m_lUserData == 20 && Str_Len(stGm.CURR_TEMPER) == 0 ||
				m_lUserData == 20 && Str_Len(stGm.CURR_PRES) == 0 ||
				m_lUserData == 20 && Str_Len(stGm.CURR_REVIS_PARA) == 0 )		
			{
				MessageBoxEx(CONFIRM_OK, "보정장치 상시계수 입력을 확인하세요.");
				ON_EXIT();
				OnInit(INIT_NUM);
				
				return FALSE;
			}
		}
		
		/****************************************************/
		/* 현재 VM, VA, VC Setting   					    */
		/****************************************************/
		Mem_Set((byte *)szIndi_VM   , 0x00, sizeof(szIndi_VM));
		Mem_Set((byte *)szIndi_VA   , 0x00, sizeof(szIndi_VA));
		Mem_Set((byte *)szIndi_VC   , 0x00, sizeof(szIndi_VC));
			
		// 계량기
		if(m_lUserData == 10)
		{
			Str_Cpy(szIndi_VM, "-1");
			Str_Cpy(szIndi_VA, "-1");
			Str_Cpy(szIndi_VC, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
		}
		//보정기
		else if(m_lUserData == 20)
		{
			Str_Cpy(szIndi_VM, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VM)));
			Str_Cpy(szIndi_VA, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VA)));
			Str_Cpy(szIndi_VC, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
		}
		//온도온압보정
		else
		{
			Str_Cpy(szIndi_VM, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VM)));
			Str_Cpy(szIndi_VA, "-1");
			Str_Cpy(szIndi_VC, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
		}		
		
		nIndi_VM = Str_AtoI(szIndi_VM);
		nIndi_VA = Str_AtoI(szIndi_VA);
		nIndi_VC = Str_AtoI(szIndi_VC);
		
		/****************************************************/
		/* 3:교체이고 계량기가 아닌 경우                    */
		/****************************************************/
		if( Str_Cmp(m_szMtr_Code, "3") == 0 && m_lUserData != 10 )
		{
			Mem_Set((byte *)m_szIndiQty, 0x00, sizeof(m_szIndiQty));
		}
		else
		{
			Cal_UseQty(szIndi_VC);
		}
		
		/****************************************************/
		/* 2:부재 검사									 	*/
		/****************************************************/
		if( Str_Cmp(m_szMtr_Code, "2") == 0 )
		{
			// 100등급 이상일 경우 부재 불가
			if( Str_AtoI(stGm.GRD_TITLE) >= 100 )
			{
				MessageBoxEx(CONFIRM_OK, "계량기 100등급 이상\n부재코드(2) 입력불가 ");
				
				Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
				Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
				
				return FALSE;
			}
			
			// 계약상태 중지인 경우 부재 불가
			if( Str_Cmp(stGm.SUPPLY_STS_CD, "중지") == 0 )
			{
				MessageBoxEx(CONFIRM_OK, "중지세대\n부재코드(2) 입력불가");
				
				Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
				Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
				
				return FALSE;
			}
			
			// 부재는 지침 입력 불가
			if( Str_Len(szIndi_VC) != 0 )
			{
				MessageBoxEx(CONFIRM_OK, "부재코드(2)\n지침 입력불가");
				
				Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
				Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
				
				if(m_lUserData == 10)
				{
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "" );
				}
				else if(m_lUserData == 20)
				{
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), "" );
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VA), "" );
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "" );
				}
				else 
				{
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), "" );
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "" );
				}
				
				return FALSE;
			}
			
			// 보정장치이며 VA입력된 경우( 온도,온압보정 추가로 인한 수정(VA미입력) )
			if( Str_Len(szIndi_VA) != 0 && m_lUserData == 20)   
			{
				MessageBoxEx(CONFIRM_OK, "부재코드(2)\n지침 입력불가");
				EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VA), "" );
				
				Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
				Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
				
				return FALSE;
			}
			
			// 계량기가 아닌 이외의 장치 일때 VM이 입력된 경우
			if( Str_Len(szIndi_VM) != 0 && m_lUserData != 10)
			{
				MessageBoxEx(CONFIRM_OK, "부재코드(2)\n지침 입력불가");
				EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), "" );
				
				Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
				Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
				
				return FALSE;
			}
			
			// 부재 데이터 입력
			Mem_Set((byte *)szIndi_VM   , 0x00, sizeof(szIndi_VM));
			Mem_Set((byte *)szIndi_VA   , 0x00, sizeof(szIndi_VA));
			Mem_Set((byte *)szIndi_VC   , 0x00, sizeof(szIndi_VC));
			Mem_Set((byte *)m_szIndiQty  , 0x00, sizeof(m_szIndiQty));
		
			Str_Cpy(szIndi_VM, "");
			Str_Cpy(szIndi_VA, "");
			Str_Cpy(szIndi_VC, "");
			Str_Cpy(m_szIndiQty, "");
			
			// stGm 부재일때 저장
			Mem_Set((byte *)stGm.MTR_WORK_CODE, 0x00, sizeof(stGm.MTR_WORK_CODE));
			Mem_Set((byte *)stGm.INDI_SET_VM, 0x00, sizeof(stGm.INDI_SET_VM));
			Mem_Set((byte *)stGm.INDI_SET_VA, 0x00, sizeof(stGm.INDI_SET_VA));
			Mem_Set((byte *)stGm.INDI_SET_VC, 0x00, sizeof(stGm.INDI_SET_VC));
			Mem_Set((byte *)stGm.INDI_QTY, 0x00, sizeof(stGm.INDI_QTY));
			Mem_Set((byte *)stGm.INDI_DATE, 0x00, sizeof(stGm.INDI_DATE));
			Mem_Set((byte *)stGm.SEND_YN, 0x00, sizeof(stGm.SEND_YN));
			
			Str_Cpy(stGm.MTR_WORK_CODE, m_szMtr_Code);		//코드
			Str_Cpy(stGm.INDI_SET_VM, szIndi_VM);			//VM
			Str_Cpy(stGm.INDI_SET_VA, szIndi_VA);			//VA
			Str_Cpy(stGm.INDI_SET_VC, szIndi_VC);			//VC
			Str_Cpy(stGm.INDI_QTY, m_szIndiQty);			//사용량
			Str_Cpy(stGm.INDI_DATE, szDate);				//날짜
			Str_Cpy(stGm.SEND_YN, "S");						//송신여부
			
			return TRUE;
		}
		/****************************************************/
		/* 2:부재 외 검사									*/
		/****************************************************/
		else
		{	
			// 현재지침, 전월지침, 전전월지침이 모두 같은 경우
			if( Str_Cmp(szIndi_VC, stGm.BEFO_MM_INDI_COMPENS_VC_1) == 0 &&
				Str_Cmp(szIndi_VC, stGm.BEFO_MM_INDI_COMPENS_VC_2) == 0)
			{
				// A:미입주, B:미사용, C:없음, D:미기타, 6:고장, 7:해가인 경우
				if( Str_Cmp(m_szMtr_Code, "A") !=0 && Str_Cmp(m_szMtr_Code, "B") !=0 && Str_Cmp(m_szMtr_Code, "C") !=0 &&
					Str_Cmp(m_szMtr_Code, "D") !=0 && Str_Cmp(m_szMtr_Code, "6") !=0 && Str_Cmp(m_szMtr_Code, "7") !=0 )
				{
					MessageBoxEx(CONFIRM_OK, "전3개월 동일지침시\n미입주, 미사용 코드만\n입력가능");
					
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
					
					return FALSE;
				}	
			}
			
			// 7:해가 인 경우
			if( Str_Cmp(m_szMtr_Code, "7") == 0 )
			{
				// 보정장치인 경우
				if( m_lUserData == 20 )
				{
					// VC, VA, VM 모두 입력하거나 모두 삭제해야함
					if( !( (Str_Len(szIndi_VC) > 0 && Str_Len(szIndi_VA) > 0 && Str_Len(szIndi_VM) > 0) ||
					       (Str_Len(szIndi_VC) == 0 && Str_Len(szIndi_VA) == 0 && Str_Len(szIndi_VM) == 0) ) )
					{
						MessageBoxEx(CONFIRM_OK, "지침값을 모두 입력하거나\n삭제하십시오!");
						
						Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
						Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
						
						return FALSE;
					}
				}
			}
			
			// C:없음인 경우
			if( Str_Cmp(m_szMtr_Code, "C") == 0 )
			{
				// 보정장치인 경우
				if( m_lUserData == 20 ) 
				{
					// VC, VA, VM 모두 입력불가
					if( !( Str_Len(szIndi_VC) == 0 && Str_Len(szIndi_VA) == 0 && Str_Len(szIndi_VM) == 0) )
					{
						MessageBoxEx(CONFIRM_OK, "지침값 입력불가");
						
						Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
						Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
						
						return FALSE;
					}
				}
				// 보정장치가 아닌 경우
				else
				{
					// VC입력불가
					if(  Str_Len(szIndi_VC) != 0 )
					{
						MessageBoxEx(CONFIRM_OK, "지침값 입력불가");
						
						Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
						Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
						
						return FALSE;
					}			
				}
				
				// 없음 데이터 입력
				Mem_Set((byte *)szIndi_VM   , 0x00, sizeof(szIndi_VM));
				Mem_Set((byte *)szIndi_VA   , 0x00, sizeof(szIndi_VA));
				Mem_Set((byte *)szIndi_VC   , 0x00, sizeof(szIndi_VC));
				Mem_Set((byte *)m_szIndiQty  , 0x00, sizeof(m_szIndiQty));
				
				Str_Cpy(szIndi_VM, "");
				Str_Cpy(szIndi_VA, "");
				Str_Cpy(szIndi_VC, "");
				Str_Cpy(m_szIndiQty, "");
				
				// stGm 부재일때 저장
				Mem_Set((byte *)stGm.MTR_WORK_CODE, 0x00, sizeof(stGm.MTR_WORK_CODE));
				Mem_Set((byte *)stGm.INDI_SET_VM, 0x00, sizeof(stGm.INDI_SET_VM));
				Mem_Set((byte *)stGm.INDI_SET_VA, 0x00, sizeof(stGm.INDI_SET_VA));
				Mem_Set((byte *)stGm.INDI_SET_VC, 0x00, sizeof(stGm.INDI_SET_VC));
				Mem_Set((byte *)stGm.INDI_QTY, 0x00, sizeof(stGm.INDI_QTY));
				Mem_Set((byte *)stGm.INDI_DATE, 0x00, sizeof(stGm.INDI_DATE));
				Mem_Set((byte *)stGm.SEND_YN, 0x00, sizeof(stGm.SEND_YN));
				
				Str_Cpy(stGm.MTR_WORK_CODE,m_szMtr_Code);		//코드
				Str_Cpy(stGm.INDI_SET_VM, szIndi_VM);			//VM
				Str_Cpy(stGm.INDI_SET_VA, szIndi_VA);			//VA
				Str_Cpy(stGm.INDI_SET_VC, szIndi_VC);			//VC
				Str_Cpy(stGm.INDI_QTY, m_szIndiQty);			//사용량
				Str_Cpy(stGm.INDI_DATE, szDate);				//날짜
				Str_Cpy(stGm.SEND_YN, "S");						//송신여부
				
				return TRUE;
			}
			// C:없음이 아닌 경우
			else
			{
				// VC입력 확인
				if( Str_Len(szIndi_VC) == 0 )
				{
					MessageBoxEx(CONFIRM_OK, "검침 지침(VC)를 입력하세요.");
					
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
					
					return FALSE;
				}
				
				// 보정장치인 경우 VA 입력확인
				if( Str_Len(szIndi_VA) == 0 && m_lUserData == 20 )
				{
					MessageBoxEx(CONFIRM_OK, "검침 지침(VA)를 입력하세요.");
					
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
					
					return FALSE;
				}
				
				// 계량기가 아닌 경우 VM 입력 확인
				if( Str_Len(szIndi_VM) == 0 && m_lUserData != 10 )
				{
					MessageBoxEx(CONFIRM_OK, "검침 지침(VM)를 입력하세요.");
					
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
					
					return FALSE;
				}
			}
		}		
		
		/****************************************************/
		/* 전월지침 확인									*/
		/****************************************************/
		
		// 전월지침 저장
		nBefo_Indi_VC_1 = Str_AtoI(stGm.BEFO_MM_INDI_COMPENS_VC_1);
		
		// 1:정상검침, G:대문검침, T:전화검침, N:원격지시부
		if( Str_Cmp(m_szMtr_Code, "1") == 0 || Str_Cmp(m_szMtr_Code, "G") == 0 || Str_Cmp(m_szMtr_Code, "T") == 0 || Str_Cmp(m_szMtr_Code, "N") == 0 )
		{
			// 전월지침이 현재지침보다 큰 경우
			if( nBefo_Indi_VC_1 > nIndi_VC )
			{
				if(MessageBoxTitle(TITLE_ERROR_YESNO, "역지침 발생","지침 또는 검침코드 재확인\n(계량기교체, 순회확인)\n계속 진행 하시겠습니까?") != MB_OK)
				{
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
					
					return FALSE;
				}
			}
			
			// 전월지침이 현재지침과 같은 경우
			if( nBefo_Indi_VC_1 == nIndi_VC )
			{
				if(MessageBoxEx(CONFIRM_YESNO, "당월 사용량이 '0'\n지침 또는 검침코드(미사용) 재확인\n계속 진행 하시겠습니까?") != MB_OK)
				{
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
					
					return FALSE;
				}
			}
		}
		// 3:교체, 5:순회
		else if( Str_Cmp(m_szMtr_Code, "3") == 0 || Str_Cmp(m_szMtr_Code, "5") == 0 )
		{
			// 전월지침이 현재지침보다 작은 경우
			if( nBefo_Indi_VC_1 < nIndi_VC)
			{
				if(MessageBoxEx(CONFIRM_YESNO, "당월지침이 전월지침보다 큽니다\n지침 또는 검침코드 재확인\n계속 진행 하시겠습니까?") != MB_OK)
				{
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
					
					return FALSE;
				}
			}
			
			// 전월지침이 현재지침과 같은 경우
			if( nBefo_Indi_VC_1 == nIndi_VC)
			{
				if( MessageBoxEx(CONFIRM_YESNO, "당월지침과 전월지침이 동일\n지침 또는 검침코드 재확인\n계속 진행 하시겠습니까?") != MB_OK)
				{
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
					
					return FALSE;
				}
			}
		}
		// A:미입주, B:미사용, D:미기타
		else if( Str_Cmp(m_szMtr_Code, "A") == 0 || Str_Cmp(m_szMtr_Code, "B") == 0 || Str_Cmp(m_szMtr_Code, "D") == 0 )
		{	
			// 전월지침이 현재지침보다 작은 경우
			if( nBefo_Indi_VC_1 < nIndi_VC)		
			{
				if( MessageBoxEx(CONFIRM_YESNO, "미사용 검침코드이나 당월사용량 발생\n정상검침코드로 변경 하시겠습니까?") != MB_OK )
				{
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
					
					return FALSE;
				}
				else
				{
					Str_Cpy(m_szMtr_Code, RE_GM_CODE[0].Code);
				}
			}
			// 전춸지침이 현재지침보다 큰 경우
			else if( nBefo_Indi_VC_1 > nIndi_VC)
			{
				if(MessageBoxTitle(TITLE_ERROR_YESNO, "역지침 발생", "지침 또는 검침코드 재확인\n(계량기 교체, 순회, 고장 여부확인)\n진행 하시겠습니까?") != MB_OK )
				{
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
					
					return FALSE;
				}
			}
			// 전춸지침이 현재침과 같은 경우
			else if( nBefo_Indi_VC_1 == nIndi_VC)
			{
				Mem_Set((byte *)stGm.MTR_WORK_CODE, 0x00, sizeof(stGm.MTR_WORK_CODE));
				Mem_Set((byte *)stGm.INDI_SET_VM, 0x00, sizeof(stGm.INDI_SET_VM));
				Mem_Set((byte *)stGm.INDI_SET_VA, 0x00, sizeof(stGm.INDI_SET_VA));
				Mem_Set((byte *)stGm.INDI_SET_VC, 0x00, sizeof(stGm.INDI_SET_VC));
				Mem_Set((byte *)stGm.INDI_QTY, 0x00, sizeof(stGm.INDI_QTY));
				Mem_Set((byte *)stGm.INDI_DATE, 0x00, sizeof(stGm.INDI_DATE));
				Mem_Set((byte *)stGm.SEND_YN, 0x00, sizeof(stGm.SEND_YN));

				Str_Cpy(stGm.MTR_WORK_CODE,m_szMtr_Code);		//코드
				Str_Cpy(stGm.INDI_SET_VM, szIndi_VM);			//VM
				Str_Cpy(stGm.INDI_SET_VA, szIndi_VA);			//VA
				Str_Cpy(stGm.INDI_SET_VC, szIndi_VC);			//VC
				Str_Cpy(stGm.INDI_QTY, m_szIndiQty);			//사용량
				Str_Cpy(stGm.INDI_DATE, szDate);				//날짜
				Str_Cpy(stGm.SEND_YN, "S");						//송신여부
				
				return TRUE;
			}
		}
		
		/****************************************************/
		/* 사용량 확인  									*/
		/****************************************************/
		nBefo_Indi_VM_1 = Str_AtoI(stGm.BEFO_MM_INDI_MTR_1);
		nBefo_Indi_VA_1 = Str_AtoI(stGm.BEFO_MM_INDI_COMPENS_VA_1);
		nIndi_Qty = Str_AtoI(m_szIndiQty);
		nIndi_VMUse = (nIndi_VM - nBefo_Indi_VM_1);
		nIndi_VAUse = (nIndi_VA - nBefo_Indi_VA_1);
		
		// 사용량이 마이너스일 경우 -> 큰수 나눗기가 안되어 양의정수로 변환한다.
		if(nIndi_Qty < 0)
		{
			nIndi_Qty = nIndi_Qty * (-1);
			nChkplus1 = 1;
		}
		if(nIndi_VMUse < 0)
		{
			nIndi_VMUse = nIndi_VMUse * (-1);
			nChkplus2 = 1;
		}
		if(nIndi_VAUse < 0)
		{
			nIndi_VAUse = nIndi_VAUse * (-1);
			nChkplus3 = 1;
		}
		
		Str_ItoA(nIndi_VMUse, szIndi_VMUse, 10);
		Str_ItoA(nIndi_VAUse, szIndi_VAUse, 10);
		
		/****************************************************/
		/* 보정계수 확인									*/
		/****************************************************/
		Mem_Set((byte *)szhigh_v, 0x00, sizeof(szhigh_v));
		Mem_Set((byte *)szlow_v, 0x00, sizeof(szlow_v));
		
		// 저압 보정계수 체크
		if( Str_Cmp(stGm.COMPENS_FLAG, "10") == 0 ) 
		{
			Str_Cpy(szhigh_v, "1.05");
			Str_Cpy(szlow_v, "0.88");
			nhigh_v = 105;
			nlow_v = 88;
			nfactor_h = 10;
			nfactor_l = -10;
		}
		// 중간압 보정계수 체크
		else if( Str_Cmp(stGm.COMPENS_FLAG, "20") == 0 || Str_Cmp(stGm.COMPENS_FLAG, "41") == 0) 
		{

			Str_Cpy(szhigh_v, "1.40");
			Str_Cpy(szlow_v, "1.00");
			nhigh_v = 140;
			nlow_v = 100;
			nfactor_h = 300;
			nfactor_l = -300;
		}
		// 중압 보정계수 체크
		else if( Str_Cmp(stGm.COMPENS_FLAG, "30") == 0 || Str_Cmp(stGm.COMPENS_FLAG, "42") == 0) 
		{
			Str_Cpy(szhigh_v, "10.00");
			Str_Cpy(szlow_v, "4.00");
			nhigh_v = 1000;
			nlow_v = 400;
			nfactor_h = 300;
			nfactor_l = -300;	
		}
		
		// 보정장치
		if( m_lUserData == 20 )
		{
			nIndi_VA = Str_AtoI(szIndi_VA);
			nIndi_VM = Str_AtoI(szIndi_VM);

			if( (nIndi_VA - nIndi_VM) < nfactor_l )		
			{
				if(MessageBoxEx(CONFIRM_YESNO, "Va 또는 Vm 지침이상\n계속 진행 하시겠습니까?") != MB_OK) 
				{
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
					
					return FALSE;
				}
			}
			if( (nIndi_VA-nIndi_VM) > nfactor_h )
			{
				if(MessageBoxEx(CONFIRM_YESNO, "Va 또는 Vm 지침이상\n계속 진행 하시겠습니까?") != MB_OK)
				{
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
					
					return FALSE;
				}
			}
			
			Str_ItoA( nIndi_Qty, szIndi_VCUse, 10);	
			Str_Mul10x(2, szIndi_VCUse, szIndi_VCUse);
			Str_Div(szIndi_VCUse, szIndi_VAUse, szValue, szRemain);
			nValue = Str_AtoI(szValue);

			if(nChkplus1 == 1)
			{
				nValue = nValue * (-1);
			}
			if(nChkplus3 == 1)
			{
				nValue = nValue * (-1);
			}
			
			if( (nValue) > nhigh_v )
			{
				if(MessageBoxEx(CONFIRM_YESNO, "Vc 또는 Va,Vm 지침이상\n계속 진행 하시겠습니까?") != MB_OK)
				{
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
					
					return FALSE;
				}
			}
			
			if( (nValue) <  nlow_v )
			{
				if(MessageBoxEx(CONFIRM_YESNO, "Vc 또는 Va,Vm 지침이상\n계속 진행 하시겠습니까?") != MB_OK)
				{
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
					
					return FALSE;
				}
			}
		}
		// 온도, 온압 보정기인 경우
		else if( m_lUserData == 41 )
		{
			Str_ItoA(nIndi_Qty, szIndi_VCUse, 10);
			Str_Mul10x(2, szIndi_VCUse, szIndi_VCUse);
			Str_Div(szIndi_VCUse, szIndi_VAUse, szValue, szRemain);
			nValue = Str_AtoI(szValue);
			
			if(nChkplus1 == 1)
			{
				nValue = nValue * (-1);
			}
			if(nChkplus2 == 1)
			{
				nValue = nValue * (-1);
			}
			if( (nValue) > nhigh_v )
			{
				if(MessageBoxEx(CONFIRM_YESNO, "Vc 또는 Vm 지침이상\n계속 진행 하시겠습니까?") != MB_OK)
				{
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
					
					return FALSE;
				}
			}
			if( (nValue) < nlow_v )
			{
				if(MessageBoxEx(CONFIRM_YESNO, "Vc 또는 Vm 지침이상\n계속 진행 하시겠습니까?") != MB_OK)
				{
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
					
					return FALSE;
				}
			}
		}
		
		/****************************************************/
		/* C:없음, 공급상태 중지							*/
		/****************************************************/
		if( Str_Cmp(m_szMtr_Code, "C") != 0 && Str_Cmp(stGm.SUPPLY_STS_CD, "중지") == 0)
		{
			// 전월지침과 현재지침이 다른 경우
			if( nBefo_Indi_VC_1 != nIndi_VC )
			{
				MessageBoxEx(CONFIRM_OK, "중지세대\n당월사용량 발생");
				
				Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
				Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
			}
		}
		
		/****************************************************/
		/* 사용량체크					   		            */
		/****************************************************/
		if( Str_AtoI(m_szIndiQty) > 0 )
		{
			// 계량기자원구분 중 일반이 아닌 경우
			if( Str_AtoI(stGm.MTR_RESOU_FLAG) != 10 )
			{
				Mem_Set( (byte*) szSql, 0x00, sizeof( szSql) );
				Mem_Set( (byte*) sztmp, 0x00, sizeof( sztmp) );
				
				SPRINT( szSql, "SELECT PARAM10 FROM RCV_LOG WHERE GUBUN = '10' ", 0, 0, 0 );
				g_Sql_RetStr(szSql, 4, sztmp);
				
				nGmMgnfctn = Str_AtoI(sztmp);
			}else
			{
				Mem_Set( (byte*) szSql, 0x00, sizeof( szSql) );
				Mem_Set( (byte*) sztmp, 0x00, sizeof( sztmp) );
				
				SPRINT( szSql, "SELECT PARAM9 FROM RCV_LOG WHERE GUBUN = '10' ", 0, 0, 0 );
				g_Sql_RetStr(szSql, 4, sztmp);
				
				nGmMgnfctn = Str_AtoI(sztmp);
			}
			
			nBefo_UseQty_1 = Str_AtoI(stGm.BEFO_MM_USE_QTY_1);
			nBefo_UseQty_2 = Str_AtoI(stGm.BEFO_MM_USE_QTY_2);
			nBefo_UseQty_3 = Str_AtoI(stGm.BEFO_MM_USE_QTY_3);
			nBefo_UseQty = Str_AtoI(stGm.BEFO_YM_USE_QTY);
			nChk_Use = 0;
			nChk_Cnt = 0;

			// 전년 동월
			if( (nBefo_UseQty > 0) && (nGmMgnfctn > 0) && (nChk_Cnt == 0) )
			{
				// 전년대비 사용량 과다
				if( (nIndi_Qty * 100) > (nBefo_UseQty * nGmMgnfctn) )
				{
					Str_ItoA(nIndi_Qty/nBefo_UseQty, szMsg, 10);
					Str_ItoA(nIndi_VC, szIndi_VC, 10);
					Str_ItoA(nIndi_Qty, m_szIndiQty, 10);

					Str_Cpy(szStr1, "전년동월 사용량 대비\n");
					Str_Cat(szStr1, szMsg);	
					Str_Cat(szStr1, "배 사용량 발생\n지침 : ");
					Str_Cat(szStr1, szIndi_VC);
					Str_Cat(szStr1, "  사용량 : ");
					Str_Cat(szStr1, m_szIndiQty);
					
					if(MessageBoxTitle(TITLE_ERROR_YESNO, "사용량과다 발생", szStr1) != MB_OK)
					{
						Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
						Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
						
						return FALSE;
					}
				}
				// 전년대비 사용량 감소
				else if( nIndi_Qty * nGmMgnfctn < (nBefo_UseQty * 100)  )
				{
					Str_ItoA(nIndi_VC, szIndi_VC, 10);
					Str_ItoA(nIndi_Qty, m_szIndiQty, 10);
					
					Str_Cpy(szStr1, " 전년동월 사용량 대비\n사용량 감소\n지침 : ");
					Str_Cat(szStr1, szIndi_VC);
					Str_Cat(szStr1, "  사용량 : ");
					Str_Cat(szStr1, m_szIndiQty);
					
					if(MessageBoxTitle(TITLE_ERROR_YESNO, "사용량감소 발생", szStr1) != MB_OK)
					{
						Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
						Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
						
						return FALSE;
					}
				}
				
				nChk_Cnt++;
			}
			
			// 3개월
			if( nBefo_UseQty_1 > 0 )
			{
				nChk_Use += nBefo_UseQty_1;
				idx++;
			}
			
			if( nBefo_UseQty_2 > 0 )
			{
				nChk_Use += nBefo_UseQty_2;
				idx++;			
			}
			
			if( nBefo_UseQty_3 > 0 )
			{
				nChk_Use += nBefo_UseQty_3;
				idx++;			
			}
			
			if( idx > 0 )
			{
				nChk_Use = nChk_Use / idx;
			}
			
			if( nChk_Use > 0 && nGmMgnfctn > 0 && nChk_Cnt == 0 )
			{
				// 3개월대비 사용량과다
				if( (nIndi_Qty * 100) > (nChk_Use * nGmMgnfctn) )
				{
					Str_ItoA((nIndi_Qty / nChk_Use), szMsg, 10);
					Str_ItoA(nIndi_VC, szIndi_VC, 10);
					Str_ItoA(nIndi_Qty, m_szIndiQty, 10);
					
					Str_Cpy(szStr1, "3개월 평균 사용량 대비\n");
					Str_Cat(szStr1, szMsg);
					Str_Cat(szStr1, "배 사용량 발생\n지침 : ");
					Str_Cat(szStr1, szIndi_VC);
					Str_Cat(szStr1, "  사용량 : ");
					Str_Cat(szStr1, m_szIndiQty);

					if(MessageBoxTitle(TITLE_ERROR_YESNO, "사용량과다 발생",szStr1) != MB_OK)
					{
						Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
						Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
						
						return FALSE;
					}
					
					nChk_Cnt++;
				}
				
				// 3개월대비 사용량감소
				if( nIndi_Qty * nGmMgnfctn < nChk_Use * 100 )
				{
					Str_ItoA((nIndi_Qty / nChk_Use), szMsg, 10);
					Str_ItoA(nIndi_VC, szIndi_VC, 10);
					Str_ItoA(nIndi_Qty, m_szIndiQty, 10);
					
					Str_Cpy(szStr1, "3개월 평균 대비 사용량 감소\n지침 : ");
					Str_Cat(szStr1, szIndi_VC);
					Str_Cat(szStr1, "  사용량 : ");
					Str_Cat(szStr1, m_szIndiQty);
				
					if(MessageBoxTitle(TITLE_ERROR_YESNO, "사용량감소 발생",szStr1) != MB_OK)
					{
						Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
						Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
						
						return FALSE;
					}
					
					nChk_Cnt++;
				}
			}
		}
		
		/****************************************************/
		/* 최대사용량체크 : 2017.11.30 신기호	            */
		/****************************************************/ 
		
		// 6:고장이 아닌 경우
		if( m_szMtr_Code[0] != '6' )
		{
			// 최대사용량 저장을 한번 이상 한 경우
			if( m_maxQtySaveCnt > 0 )
			{
				// 최대사용량 이전 저장 지침과 현재지침이 다른 경우
				if( Str_Cmp(m_beforeVc, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)) ) != 0 )
				{
					Mem_Set((byte *)strMsg1, 0x00, sizeof(strMsg1));
						
					Str_Cpy(strMsg1, "지침을 저장 하시겠습니까?\n ");
					Str_Cat(strMsg1, "\n현재 사용량 : ");
					Str_Cat(strMsg1, m_szIndiQty);
					Str_Cat(strMsg1, "\n최대 사용량 : ");
					Str_Cat(strMsg1, stGm.MAX_GMTR_QTY);
					
					if(MessageBoxTitle(TITLE_ERROR_YESNO, "사용량 확인", strMsg1) != MB_OK)
					{	
						EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "");
						EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), "");
						
						Mem_Set( (byte*)stGm.INDI_SET_VC, 0x00, sizeof(stGm.INDI_SET_VC));
						Str_Cpy( stGm.INDI_SET_VC, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
						
						Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
						Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
						
						return FALSE;
					}
					else
					{
						Mem_Set((byte *)m_beforeVc, 0x00, sizeof(m_beforeVc));
						m_maxQtySaveCnt = 0;
					}
				}
			}
			// 최대사용량 저장을 처음 하는 경우
			else
			{
				// 최대 사용량을 초과한 경우
				if( Str_AtoI(m_szIndiQty) > Str_AtoI(stGm.MAX_GMTR_QTY) )
				{
					Mem_Set((byte *)strMsg1, 0x00, sizeof(strMsg1));
							
					Str_Cpy(strMsg1, "최대 사용량을 초과하였습니다");
					Str_Cat(strMsg1, "\n현재 사용량 : ");
					Str_Cat(strMsg1, m_szIndiQty);
					Str_Cat(strMsg1, "\n최대 사용량 : ");
					Str_Cat(strMsg1, stGm.MAX_GMTR_QTY);
					Str_Cat(strMsg1, "\n ");
					Str_Cat(strMsg1, "\n[재 입력해주세요]");
					MessageBoxEx(ERROR_OK, strMsg1);
					
					Mem_Set((byte *)m_beforeVc, 0x00, sizeof(m_beforeVc));
					Str_Cpy( m_beforeVc, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)) );
					
					m_maxQtySaveCnt++;
					
					EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "");
					EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), "");
	
					Mem_Set( (byte*)stGm.INDI_SET_VC, 0x00, sizeof(stGm.INDI_SET_VC));
					Str_Cpy( stGm.INDI_SET_VC, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
					
					Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
					Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
	
					return FALSE;	
				}	
			}
		}
		
		// 계량기
		if( m_lUserData == 10 )
		{
			Mem_Set((byte *)szIndi_VC   , 0x00, sizeof(szIndi_VC));
			
			Str_Cpy(szIndi_VC, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
		}
		//보정장치
		else if( m_lUserData == 20 )
		{
			Mem_Set((byte *)szIndi_VM   , 0x00, sizeof(szIndi_VM));
			Mem_Set((byte *)szIndi_VA   , 0x00, sizeof(szIndi_VA));
			Mem_Set((byte *)szIndi_VC   , 0x00, sizeof(szIndi_VC));
			
			Str_Cpy(szIndi_VM, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VM)));
			Str_Cpy(szIndi_VA, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VA)));
			Str_Cpy(szIndi_VC, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
		}
		//온도, 온압보정장치
		else
		{
			Mem_Set((byte *)szIndi_VM   , 0x00, sizeof(szIndi_VM));
			Mem_Set((byte *)szIndi_VC   , 0x00, sizeof(szIndi_VC));
			
			Str_Cpy(szIndi_VM, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VM)));
			Str_Cpy(szIndi_VC, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
		}

		Mem_Set((byte *)stGm.MTR_WORK_CODE, 0x00, sizeof(stGm.MTR_WORK_CODE));
		Mem_Set((byte *)stGm.INDI_SET_VM, 0x00, sizeof(stGm.INDI_SET_VM));
		Mem_Set((byte *)stGm.INDI_SET_VA, 0x00, sizeof(stGm.INDI_SET_VA));
		Mem_Set((byte *)stGm.INDI_SET_VC, 0x00, sizeof(stGm.INDI_SET_VC));
		Mem_Set((byte *)stGm.INDI_QTY, 0x00, sizeof(stGm.INDI_QTY));
		Mem_Set((byte *)stGm.INDI_DATE, 0x00, sizeof(stGm.INDI_DATE));
		Mem_Set((byte *)stGm.SEND_YN, 0x00, sizeof(stGm.SEND_YN));
		
		Str_Cpy(stGm.MTR_WORK_CODE,m_szMtr_Code);		//코드
		Str_Cpy(stGm.INDI_SET_VM, szIndi_VM);			//VM
		Str_Cpy(stGm.INDI_SET_VA, szIndi_VA);			//VA
		Str_Cpy(stGm.INDI_SET_VC, szIndi_VC);			//VC
		Str_Cpy(stGm.INDI_QTY, m_szIndiQty);			//사용량
		Str_Cpy(stGm.INDI_DATE, szDate);				//날짜
		Str_Cpy(stGm.SEND_YN, "S");						//송신여부
		
		return TRUE;
	}
	
	/*=======================================================================================
	함수명 : Cal_UseQty
	기  능 : 사용량 계산
	Param  : 
	Return : 
	========================================================================================*/	
	void Cal_UseQty(char *szIndi_VC)
	{
		long i = 0;
		long lLength = 0;
		long lAddValue = 10;
		long lUseQty = 0;		//현재사용량
		long lIndi_VC = 0;		//현재지침
		long lPrevVc = 0;		//전원지침
		long lCivilVc = 0;		//지침보정기민원_VC
		
		Mem_Set((byte*)m_szIndiQty, 0x00, sizeof(m_szIndiQty) );
		Mem_Set((byte*)m_szMtr_Code, 0x00, sizeof(m_szMtr_Code) );
		
		i = SearchStr( EditCtrl_GetStr(Get_hDlgCtrlByID(CMB_RESULT)), RE_GM_CODE );
		
		if (i == -1)
		{
			Str_Cpy(m_szMtr_Code, RE_GM_CODE[0].Code);
		}
		else
		{
			Str_Cpy(m_szMtr_Code, RE_GM_CODE[i].Code);
		}
		
		lIndi_VC = Str_AtoI(szIndi_VC);
		lPrevVc = Str_AtoI(stGm.BEFO_MM_INDI_COMPENS_VC_1);
		lCivilVc = Str_AtoI(stGm.INDI_COMPENS_CIVIL_SERV_VC);
		
		/*************************/
		/* 계산 시 ADDVALUE 계산 */
		/*************************/
		// 5:순회
		if( m_szMtr_Code[0] == '5' )
		{	
			lLength = Str_Len(stGm.BEFO_MM_INDI_COMPENS_VC_1);
			
			for(i = 0 ; i < (lLength - 1) ; i++)
			{
				lAddValue = lAddValue * 10;
			}
		}
		// 3:교체
		else if( m_szMtr_Code[0] == '3' )
		{
			lAddValue = lCivilVc-lPrevVc;

		    if(lAddValue < 1)
		    {
				lAddValue = 0;
			}
		}
		// 나머지
		else
		{
			lAddValue = 0;
		}
		
		/**************************/
		/* VC가 0보다 큰경우 계산 */
		/**************************/
		if(Str_Len(szIndi_VC) > 0)
		{
			// 3:교체
			if( m_szMtr_Code[0] == '3' )
			{		
				lUseQty = lIndi_VC + lAddValue;
				Str_ItoA(lUseQty, m_szIndiQty, 10);
			}
			// 나머지
			else
			{
				lUseQty = lIndi_VC - lPrevVc + lAddValue;
				Str_ItoA(lUseQty, m_szIndiQty, 10);
			}
		}
		
		return;
	}
	
	/*=======================================================================================
	함수명 : Save_Gm
	기  능 : 검침 데이터를 저장한다.
	Param  : 
	Return : 온도온압보정, 보정기 둘다 계산해서 Qty 저장해야함.
	========================================================================================*/
	long Save_Gm(void)
	{
		char sztmp[100];
		long idx, ret = -1, fd;
		handle hdb = NULL;
		handle hstmt = NULL;
		SQLITE sql = NewSqLite();
		long lsign, lSign_Len;
		char* pRst = NULL;
		
		// 2017-05-28 Sanghyun Lee
		// 문자검침 대상이 아닐 경우에만 서명 등록, 문자검침 대상은 검침 체크룰 통과
		if( Str_Cmp(stGm.MTR_WORK_CODE, "L") != 0 )
		{
			// 대용량 일경우 사인을 받는다. 100등급 이상일 경우 서명.
			if( Str_AtoI(stGm.GRD_TITLE) >= 100 )
			{
				//서명
				Mem_Set((byte*)g_SignBuf, 0xff, sizeof(g_SignBuf));
				lsign = GetSignImgTitleWithOpt( SIGN_WIDTH, SIGN_HEIGHT, (char*)g_SignBuf, "고 객 서 명", SIGN_OPT_NONE );
				
				if( lsign == SIGN_RET_CANCEL || lsign == SIGN_RET_FAIL )
				{
					ret = -1;
					return ret;
				}
				else
				{
					g_png_getbmp(SIGN_WIDTH, SIGN_HEIGHT, g_SignBuf );
					if(g_pjcomm != NULL )
					{
						BASE64_Finalize(g_pjcomm);
						g_pjcomm = NULL;
					}
					
					g_pjcomm = BASE64_Create();
					lSign_Len = BASE64_Encode(g_pjcomm, g_SignBuf, BMP_SIZE );
					pRst = BASE64_GetResult(g_pjcomm);				
				}
			}
		}

		// 순수미검침의 경우, 검침 진행 중 리스트로 돌아가면 순수미검침 대상이 검침이 되었어도 보이게 하기 위해서
		// 검침메뉴(GM_MENU)화면 로드 시 'SEND_YN' 을 'S'로 업데이트
		Mem_Set( (byte*)stGm.SEND_YN, 0x00, sizeof(stGm.SEND_YN) );
		
		if( g_nWorkFlag == 103 ) // 103번 : 미검침 목록(리스트)
		{
			Str_Cpy(stGm.SEND_YN, "I");
		}
		else
		{
			Str_Cpy(stGm.SEND_YN, "S");
		}

		hdb = sql->Open(sql);
		
		if( hdb == NULL )
		{
			goto Finally;
		}

		// 2017-05-28 Sanghyun Lee
		// 문자검침 대상이 아닐 경우에만 서명 등록, 문자검침 대상은 검침 체크룰 통과
		if( Str_Cmp(stGm.MTR_WORK_CODE, "L") != 0 )
		{
			// 100등급 이상
			if( Str_AtoI(stGm.GRD_TITLE) >= 100 )
			{
				hstmt = sql->CreateStatement(sql, "UPDATE REGUMDATA \
													  SET MTR_WORK_CODE = ?, INDI_SET_VM = ?, INDI_SET_VA = ?, INDI_SET_VC = ?, INDI_QTY = ? \
													    , INDI_DATE = ?, SEND_YN = ?, CURR_TEMPER = ?, CURR_PRES = ?, CURR_REVIS_PARA = ? \
													    , SMS_GMTR_MAN_YN = ?, CUSTOM_SIGN = ? WHERE ROWID = ? " 
				);
			}
			// 나머지
			else
			{		
				hstmt = sql->CreateStatement(sql, "UPDATE REGUMDATA \
													  SET MTR_WORK_CODE = ?, INDI_SET_VM = ?, INDI_SET_VA = ?, INDI_SET_VC = ?, INDI_QTY = ? \
													    , INDI_DATE = ?, SEND_YN = ?, CURR_TEMPER = ?, CURR_PRES = ?, CURR_REVIS_PARA = ? \
													    , SMS_GMTR_MAN_YN = ? WHERE ROWID = ? " 
				);
			}
		}
		// 문자검침 대상인 경우
		else
		{
			hstmt = sql->CreateStatement(sql, "UPDATE REGUMDATA \
												  SET MTR_WORK_CODE = ?, INDI_SET_VM = ?, INDI_SET_VA = ?, INDI_SET_VC = ?, INDI_QTY = ? \
												    , INDI_DATE = ?, SEND_YN = ?, CURR_TEMPER = ?, CURR_PRES = ?, CURR_REVIS_PARA = ? \
												    , SMS_GMTR_MAN_YN = ? WHERE ROWID = ? " 
			);
		}
		
		if( hstmt == NULL )
		{
			PRINT("::SQL_CreateStatement fail [%s]", sql->GetLastError(sql), 0, 0);
			goto Finally;
		}
		
		idx = 0;
		sql->Bind(sql, idx++, 'U', (long *)stGm.MTR_WORK_CODE	,2	,DECRYPT);
		sql->Bind(sql, idx++, 'U', (long *)stGm.INDI_SET_VM		,10	,DECRYPT);
		sql->Bind(sql, idx++, 'U', (long *)stGm.INDI_SET_VA		,10	,DECRYPT);
		sql->Bind(sql, idx++, 'U', (long *)stGm.INDI_SET_VC		,10	,DECRYPT);
		sql->Bind(sql, idx++, 'U', (long *)stGm.INDI_QTY		,9	,DECRYPT);
		
		sql->Bind(sql, idx++, 'U', (long *)stGm.INDI_DATE		,16 ,DECRYPT);
		sql->Bind(sql, idx++, 'U', (long *)stGm.SEND_YN			,1  ,DECRYPT);
		sql->Bind(sql, idx++, 'U', (long *)stGm.CURR_TEMPER		,10	,DECRYPT);
		sql->Bind(sql, idx++, 'U', (long *)stGm.CURR_PRES		,10 ,DECRYPT);
		sql->Bind(sql, idx++, 'U', (long *)stGm.CURR_REVIS_PARA	,10	,DECRYPT);
		
		sql->Bind(sql, idx++, 'U', (long *)stGm.SMS_GMTR_MAN_YN	,5	,DECRYPT);

		if( Str_AtoI(stGm.GRD_TITLE) >= 100 && Str_Cmp(stGm.MTR_WORK_CODE, "L") != 0 )
		{
			sql->Bind(sql, idx++, 'U', (long *)pRst, Str_Len(pRst), DECRYPT);
		}
		
		sql->Bind(sql, idx++, 'U', (long *)stGm.ROWID, 5, DECRYPT);

		if(sql->Execute(sql) == FALSE)
		{
			PRINT("::SQL_Execute fail [%s]", sql->GetLastError(sql), 0, 0);
			goto Finally;
		}	
		
		ret = 1;
		
Finally:

		if(g_pjcomm != NULL )
		{
			BASE64_Finalize(g_pjcomm);
			g_pjcomm = NULL;
		}			
		
		DelSqLite(sql);
		
		return ret;
	}

	/*=======================================================================================
	함수명 : SearchStr
	기  능 : 스트링으로 코드인덱스를 찾는다.
	Param  : 
	Return : 코드인덱스, 없으면 -1
	========================================================================================*/
	long SearchStr( char *Str, CodeTable *CT )
	{
		long i;

		for ( i = 0 ; CT[i].Code[0] != 0 ; i++)
		{
			if( Str_Cmp(Str, CT[i].Str) == 0 )
			{
				return i;
			}
		}
		
		return -1;
	}
	
	/*=======================================================================================
	함수명 : SearchCD
	기  능 : 코드값으로 코드인덱스를 찾는다.
	Param  : 
	Return : 코드인덱스, 없으면 -1
	========================================================================================*/
	long SearchCD( char *CD, CodeTable *CT )
	{
		long i;
		
		for(i = 0; CT[i].Code[0] != 0; i++)
		{	
			if ( Str_Cmp(CD, CT[i].Code) == 0)
			{
				return i;
			}
		}
		
		return -1;
	}
	
	/*=======================================================================================
	함수명 : SaveInput
	기  능 : 다른 업무 화면, 팝업창이 사용되도 
	         원래 검침등록 화면으로 돌아오면 입력되있는 값이 다시 나올수있도록 하기위한 함수
	Param  : 
	Return :
	========================================================================================*/
	void SaveInput(void)
	{
		Mem_Set((byte *)g_szIndi_MtrCode, 0x00, sizeof(g_szIndi_MtrCode));
		Mem_Set((byte *)g_szIndi_Vm, 0x00, sizeof(g_szIndi_Vm));
		Mem_Set((byte *)g_szIndi_Va, 0x00, sizeof(g_szIndi_Va));
		Mem_Set((byte *)g_szIndi_Vc, 0x00, sizeof(g_szIndi_Vc));
		Mem_Set((byte *)g_szIndi_Qty, 0x00, sizeof(g_szIndi_Qty));

		if( 10 == m_lUserData )
		{
			Str_Cpy(g_szIndi_MtrCode, EditCtrl_GetStr(Get_hDlgCtrlByID(CMB_RESULT)));
			Str_Cpy(g_szIndi_Vc, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
			Str_Cpy(g_szIndi_Qty, EditCtrl_GetStr(Get_hDlgCtrlByID(TXT_USEQTY)));
		}
		else if( 20 == m_lUserData )
		{
			Str_Cpy(g_szIndi_MtrCode, EditCtrl_GetStr(Get_hDlgCtrlByID(CMB_RESULT)));
			Str_Cpy(g_szIndi_Vm, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VM)));
			Str_Cpy(g_szIndi_Va, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VA)));
			Str_Cpy(g_szIndi_Vc, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
			Str_Cpy(g_szIndi_Qty, EditCtrl_GetStr(Get_hDlgCtrlByID(TXT_DATA13)));
		}
		else
		{	
			Str_Cpy(g_szIndi_MtrCode, EditCtrl_GetStr(Get_hDlgCtrlByID(CMB_RESULT)));
			Str_Cpy(g_szIndi_Vm, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VM)));
			Str_Cpy(g_szIndi_Vc, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)));
			Str_Cpy(g_szIndi_Qty, EditCtrl_GetStr(Get_hDlgCtrlByID(TXT_DATA13)));
		}
	}
	
	/*=======================================================================================
	함수명 : Del_Gm
	기  능 : 검침 취소
	Param  : 
	Return :
	========================================================================================*/
	void Del_Gm(void)
	{
		char szSql[400];
		long idx;
		handle hdb = NULL;
		handle hstmt = NULL;
		SQLITE sql = NewSqLite();
		
		hdb = sql->Open(sql);
		
		if( hdb == NULL )
		{
			goto Finally;
		}
	
		Mem_Set( (byte*)szSql, 0x00, sizeof(szSql) );
		SPRINT(szSql, "UPDATE REGUMDATA \
						  SET MTR_WORK_CODE = '', INDI_SET_VM = '', INDI_SET_VA = '', INDI_SET_VC = '', INDI_QTY = '' \
						    , INDI_DATE = '', SEND_YN = 'N', INDI_DATE = '', CURR_TEMPER = '', CURR_PRES = '' \
						    , CURR_REVIS_PARA = '' \
				        WHERE ROWID = '%s' "
				    , stGm.ROWID, 0, 0);
	
		hstmt = sql->CreateStatement(sql, szSql);
		
		if( hstmt == NULL )
		{
			PRINT("::SQL_CreateStatement fail [%s]", sql->GetLastError(sql), 0, 0);
			goto Finally;
		}
		
		if(sql->Execute(sql) == FALSE)
		{
			PRINT("::SQL_Execute fail [%s]", sql->GetLastError(sql), 0, 0);
			goto Finally;
		}
		else
		{
			if( 10 == m_lUserData )
			{
				EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), RE_GM_CODE[0].Str);
				EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), "");
				ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);
			}
			else if( 20 == m_lUserData )
			{
				EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), RE_GM_CODE[0].Str);
				EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VA), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "");
				ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);
			}
			else
			{
				EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), RE_GM_CODE[0].Str);
				EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VM), "");
				EditCtrl_SetStr(Get_hDlgCtrlByID(EDT_VC), "");
				ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);
			}
			
			MessageBoxEx (CONFIRM_OK, "검침이 취소 되었습니다.");
			
			Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);			
			Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
		}
		
Finally:
		DelSqLite(sql);
		return;
	}
	
	/*=======================================================================================
	함수명 : FS_GetSrchTotCnt
	기  능 : 검색인덱스파일의 레코드 수를 리턴한다.
	Param  : nPos:검색 인덱스 파일의 순번
 	Return : 레코드수
	========================================================================================*/
	long FS_GetSrchTotCnt(void)
	{
		long size = 0;

		size = FFS_GetSize( SREACH_FILE );
		size = size/SRCH_FS_SIZE;
		return size;
	}
	
	/*=======================================================================================
	함수명 : Analy_Phone
	기  능 : 핸드폰 번호 형식 검증
	Param  : 
 	Return : 1 = 정상, -1 = 비정상
	========================================================================================*/
	long Analy_Phone( char* phone, char* num1, char* num2, char* num3 )
	{
		long len;
	
		Str_Chg(phone, STRCHG_DEL_NONDIGIT );
		len = Str_Len(phone);
		
		if( len == 9 )
		{
			Mem_Cpy( (byte*)num1, (byte*)phone,   2);
			Mem_Cpy( (byte*)num2, (byte*)phone+2, 3);
			Mem_Cpy( (byte*)num3, (byte*)phone+5, 4);
		}
		else if( len == 10 )
		{
			if( Mem_Cmp((byte*)phone, (byte*)"01", 2) == 0  )
			{
				Mem_Cpy( (byte*)num1, (byte*)phone,   3);
				Mem_Cpy( (byte*)num2, (byte*)phone+3, 3);
				Mem_Cpy( (byte*)num3, (byte*)phone+6, 4);
			}
			else if(  Mem_Cmp((byte*)phone, (byte*)"02", 2) == 0 )
			{
				Mem_Cpy( (byte*)num1, (byte*)phone,   2);
				Mem_Cpy( (byte*)num2, (byte*)phone+2, 4);
				Mem_Cpy( (byte*)num3, (byte*)phone+6, 4);
			}
			else
			{
				Mem_Cpy( (byte*)num1, (byte*)phone,   3);
				Mem_Cpy( (byte*)num2, (byte*)phone+3, 3);
				Mem_Cpy( (byte*)num3, (byte*)phone+6, 4);
			}
		}
		else if( len == 11 )
		{
				Mem_Cpy( (byte*)num1, (byte*)phone,   3);
				Mem_Cpy( (byte*)num2, (byte*)phone+3, 4);
				Mem_Cpy( (byte*)num3, (byte*)phone+7, 4);
		}
		else
		{
			return -1;
		}
		
		return 1;
	}
	
	/*=======================================================================================
	함수명 : Save_factor
	기  능 : 상시계수 저장
	Param  : 
 	Return :
	========================================================================================*/
	long Save_factor(void)
	{
		long ret = -1;
		char szTmp[10];		
		
		/********************************/
		/* 상시계수 저상 Validation     */
		/********************************/
		if( Str_Cmp(stGm.GMTR_OBJ_FLAG, "40") == 0 )
		{
			if( EditCtrl_GetStrLen(Get_hDlgCtrlByID(EDT_DATA4))  == 0 
			||  EditCtrl_GetStrLen(Get_hDlgCtrlByID(EDT_DATA6))  == 0 )
			{
				MessageBoxEx (CONFIRM_OK, "상시 계수를 입력하세요.");
				goto Finally2;
			}

		}
		else
		{
			if( EditCtrl_GetStrLen(Get_hDlgCtrlByID(EDT_DATA4))  == 0 
			||  EditCtrl_GetStrLen(Get_hDlgCtrlByID(EDT_DATA5))  == 0 
			||  EditCtrl_GetStrLen(Get_hDlgCtrlByID(EDT_DATA6))  == 0 )
			{
				MessageBoxEx (CONFIRM_OK, "상시 계수를 입력하세요.");
				goto Finally2;
			}
		}
		
		Mem_Set((byte*)szTmp, 0x00, sizeof(szTmp) );
		Str_Cpy( szTmp, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_DATA4)) );
		ret = Chk_float(szTmp);
		if( ret == -1 )
		{
			MessageBoxEx (CONFIRM_OK, "온도의 입력한 내용을 확인하세요.");
		}
		else if( ret == -2 )
		{
			MessageBoxEx (CONFIRM_OK, "정수는 4자리 이상일 수 없습니다.");
		}
		else if( ret == -3 )
		{
			MessageBoxEx (CONFIRM_OK, "소수점 자릿수는 4자리까지만 입력해주세요.");
		}
		else if( ret == -4 )
		{
			MessageBoxEx (CONFIRM_OK, "온도의 입력 데이터 형식이 잘못되었습니다. 다시 입력해 주세요.");
		}
		else if( ret == -5 )
		{
			MessageBoxEx (CONFIRM_OK, "온도의 입력 데이터 형식이 잘못되었습니다. 다시 입력해 주세요.");
		}
		if( ret < 0 )
		{	
			ret = -1;
			goto Finally2;
		}
		
		if( Str_Cmp(stGm.GMTR_OBJ_FLAG, "40") != 0 )
		{
			Str_Cpy( szTmp, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_DATA5)) );
			ret = Chk_float(szTmp);
			if( ret == -1 )
			{
				MessageBoxEx (CONFIRM_OK, "압력의 입력한 내용을 확인하세요.");
			}
			else if( ret == -2 )
			{
				MessageBoxEx (CONFIRM_OK, "정수는 4자리 이상일 수 없습니다.");
			}
			else if( ret == -3 )
			{
				MessageBoxEx (CONFIRM_OK, "소수점 자릿수는 4자리까지만 입력해주세요.");
			}
			else if( ret == -4 )
			{
				MessageBoxEx (CONFIRM_OK, "압력의 입력 데이터 형식이 잘못되었습니다. 다시 입력해 주세요.");
			}
			else if( ret == -5 )
			{
				MessageBoxEx (CONFIRM_OK, "압력의 입력 데이터 형식이 잘못되었습니다. 다시 입력해 주세요.");
			}
			if( ret < 0 )
			{	
				goto Finally2;
			}
		}
		
		Str_Cpy( szTmp, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_DATA6)) );
		ret = Chk_float(szTmp);
		if( ret == -1 )
		{
			MessageBoxEx (CONFIRM_OK, "보정계수의 입력한 내용을 확인하세요.");
		}
		else if( ret == -2 )
		{
			MessageBoxEx (CONFIRM_OK, "정수는 4자리 이상일 수 없습니다.");
		}
		else if( ret == -3 )
		{
			MessageBoxEx (CONFIRM_OK, "소수점 자릿수는 4자리까지만 입력해주세요.");
		}
		else if( ret == -4 )
		{
			MessageBoxEx (CONFIRM_OK, "보정계수의 입력 데이터 형식이 잘못되었습니다. 다시 입력해 주세요.");
		}
		else if( ret == -5 )
		{
			MessageBoxEx (CONFIRM_OK, "보정계수의 입력 데이터 형식이 잘못되었습니다. 다시 입력해 주세요.");
		}
		if( ret < 0 )
		{	
			goto Finally2;
		}
		
		ret = 1;
		
		/********************************/
		/* 상시계수 저장                */
		/********************************/
		Mem_Set((byte*)stGm.CURR_TEMPER, 0x00, sizeof(stGm.CURR_TEMPER) );
		Mem_Set((byte*)stGm.CURR_PRES, 0x00, sizeof(stGm.CURR_PRES) );
		Mem_Set((byte*)stGm.CURR_REVIS_PARA, 0x00, sizeof(stGm.CURR_REVIS_PARA) );
		
		Str_Cpy( stGm.CURR_TEMPER, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_DATA4)) );
		Str_Cpy( stGm.CURR_PRES, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_DATA5)) );
		Str_Cpy( stGm.CURR_REVIS_PARA, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_DATA6)) );
		
Finally2:
		return ret;
	}
	
	/*=======================================================================================
	함수명 : Chk_float
	기  능 : 상시계수 정수, 소주점 체크
	Param  : 
 	Return : -1 = 온도의 입력한 내용을 확인하세요
 	         -2 = 정수는 4자리 이상일 수 없습니다.
 	         -3 = 소수점 자릿수는 4자리까지만 입력해주세요.
 	         -4 = 온도의 입력 데이터 형식이 잘못되었습니다. 다시 입력해 주세요.
 	         -5 = 온도의 입력 데이터 형식이 잘못되었습니다. 다시 입력해 주세요.
	========================================================================================*/
	long Chk_float( char * szfloat )
	{
		char szTmp[10];
		char szTmp2[10];
		char szTmp3[10];
		long i, len;
		long chk=0;
		long ret = -1;
	
		len = Str_Len(szfloat);
		
		// 입력 내용 확인
		if(len > 9)
		{	
			ret = -1;
			goto Finally;
		}
		
		chk = 0;
		
		for( i = 0; i < len; i++ )
		{
			if(szfloat[i] == '.')
			{
				chk = i + 1;
				break;
			}
		}
		
		// 정수부분 길이체크
		if( chk == 0 &&  len > 4 )
		{
			ret = -2;
			goto Finally;
		}
		
		if( chk - 1 > 4 )
		{
			ret = -2;
			goto Finally;
		}
		
		// 소수점부분 길이체크
		if(len - (chk) > 4)
		{
			ret = -3;
			goto Finally;
		}
		
		if( chk == 0 )
		{
			chk = len + 1;
		}
		
		Mem_Set((byte*)szTmp2, 0x00, sizeof(szTmp2) );
		Mem_Set((byte*)szTmp3, 0x00, sizeof(szTmp3) );
		Mem_Cpy( (byte*)szTmp2, (byte*)szfloat, chk-1 );
		Mem_Cpy( (byte*)szTmp3, (byte*)szfloat, chk-1 );
		
		Str_Chg(szTmp3, STRCHG_DEL_NONDIGIT);
		Str_ItoA(Str_AtoI(szTmp2), szTmp3, 10 );
		
		// 온도입력 형식
		if( Str_Cmp(szTmp2, szTmp3) != 0)
		{
			ret = -4;
			goto Finally;
		}
		
		if( chk < len && len-chk > 0)
		{
			Mem_Set((byte*)szTmp2, 0x00, sizeof(szTmp2) );
			Mem_Set((byte*)szTmp3, 0x00, sizeof(szTmp3) );
			Mem_Cpy( (byte*)szTmp2, (byte*)szfloat+chk, len-(chk) );
			Mem_Cpy( (byte*)szTmp3, (byte*)szfloat+chk, len-(chk) );
			
			Str_Chg(szTmp3, STRCHG_DEL_NONDIGIT);
			if( Str_Cmp(szTmp2, szTmp3) != 0)
			{
				ret = -5;
				goto Finally;
			}
		}
		
		ret = 1;
Finally:
		return ret;
	}
	
	/*=======================================================================================
	함수명 : Sos_Key
	기  능 : SOS 기능
	Param  : 
 	Return :
	========================================================================================*/
	long Sos_Key(void)
	{
		long lLen = 0;
		long lTime = 100;
		long ret = 0;
		char szCustTel[20];
		char szUserTel[20];
		char szMsg[100];
	
		if( MessageBoxEx (CONFIRM_YESNO, "SOS기능 활성화") != MB_OK )
		{
			Dialog_SetActiveCtrl(this->m_hDlg, m_lEditCtrlIndex);
			Graphic_RefreshRegion(REFRESH_MSGY1, REFRESH_MSGY2);
			return FALSE;
		}
		
		lLen = Str_Len(stGm.CO_LIVE_NM) + Str_Len(stGm.BLD_NM);
		
		/***************************/
		/* 1번째 메세지 발송       */
		/***************************/
		Mem_Set( (byte*)szMsg, 0x00, sizeof(szMsg) );
		if( lLen == 0 )
		{
			Str_Cpy(szMsg, "[안전매니저]\n위급상황. 도와주세요!\n");
			
			if( Str_Len(stGm.TOWN) > 0 )
			{
				Str_Cat(szMsg, stGm.TOWN);
			}
			if( Str_Len(stGm.ADDR1_M) > 0 )
			{
				Str_Cat(szMsg, " ");
				Str_Cat(szMsg, stGm.ADDR1_M);
			}
			if( Str_Len(stGm.ADDR1_S) > 0 )
			{
				Str_Cat(szMsg, "-");
				Str_Cat(szMsg, stGm.ADDR1_S);
			}
			if( Str_Len(stGm.DETA_FLOOR) > 0 )
			{
				Str_Cat(szMsg, " ");
				Str_Cat(szMsg, stGm.DETA_FLOOR);
			}
			if( Str_Len(stGm.HOSU) > 0 )
			{
				Str_Cat(szMsg, " ");
				Str_Cat(szMsg, stGm.HOSU);
			}
		}
		else
		{
			Str_Cpy(szMsg, "[안전매니저]\n위급상황. 도와주세요!\n");
			
			if( Str_Len(stGm.TOWN) > 0 )
			{
				Str_Cat(szMsg, stGm.TOWN);
			}
			if( Str_Len(stGm.CO_LIVE_NM) > 0 )
			{
				Str_Cat(szMsg, " ");
				Str_Cat(szMsg, stGm.CO_LIVE_NM);
			}
			if( Str_Len(stGm.BLD_NM) > 0 )
			{
				Str_Cat(szMsg, " ");
				Str_Cat(szMsg, stGm.BLD_NM);
			}
			if( Str_Len(stGm.DETA_FLOOR) > 0 )
			{
				Str_Cat(szMsg, " ");
				Str_Cat(szMsg, stGm.DETA_FLOOR);
			}
			if( Str_Len(stGm.HOSU) > 0 )
			{
				Str_Cat(szMsg, " ");
				Str_Cat(szMsg, stGm.HOSU);
			}
		}

		Str_Chg(stUserinfo.szSos_SmsNum1, STRCHG_DEL_NONDIGIT );
		Str_Chg(stUserinfo.szpda_ip, STRCHG_DEL_NONDIGIT );
		
		ret = Tapi_SendSmsEx(stUserinfo.szSos_SmsNum1, stUserinfo.szpda_ip, szMsg, Str_Len(szMsg) );
		
		if(ret != 0)
		{
			switch(ret)
			{
				case -1:
					MessageBoxEx (WARNING_OK, "메시지 받을 전화 번호가 잘못되었습니다.");
					return ret;
				case -2:
					MessageBoxEx (WARNING_OK, "응답을 받을 전화번호가 잘못되었습니다.");
					return ret;
				case -3:
					MessageBoxEx (WARNING_OK, "내용이 비었습니다.");
					return ret;
				case -4:
					MessageBoxEx (WARNING_OK, "내용이 너무 깁니다.");
					return ret;
				default:
					MessageBoxEx (WARNING_OK, "메세지 전송에 실패했습니다.");
					return ret;
			}
		}
		
		VmSleep(lTime);
		
		/***************************/
		/* 2번째 메세지 발송       */
		/***************************/
		
		Str_Chg(stUserinfo.szSos_SmsNum2, STRCHG_DEL_NONDIGIT );
		Str_Chg(stUserinfo.szpda_ip, STRCHG_DEL_NONDIGIT );
		
		ret = Tapi_SendSmsEx(stUserinfo.szSos_SmsNum2, stUserinfo.szpda_ip, szMsg, Str_Len(szMsg) );
		
		if(ret != 0)
		{
			switch(ret)
			{
				case -1:
					MessageBoxEx (WARNING_OK, "메시지 받을 전화 번호가 잘못되었습니다.");
					return ret;
				case -2:
					MessageBoxEx (WARNING_OK, "응답을 받을 전화번호가 잘못되었습니다.");
					return ret;
				case -3:
					MessageBoxEx (WARNING_OK, "내용이 비었습니다.");
					return ret;
				case -4:
					MessageBoxEx (WARNING_OK, "내용이 너무 깁니다.");
					return ret;
				default:
					MessageBoxEx (WARNING_OK, "메세지 전송에 실패했습니다.");
					return ret;
			}
		}
		
		VmSleep(lTime);
		
		/***************************/
		/* 3번째 메세지 발송       */
		/***************************/
		Str_Chg(stUserinfo.szSos_SmsNum3, STRCHG_DEL_NONDIGIT );
		Str_Chg(stUserinfo.szpda_ip, STRCHG_DEL_NONDIGIT );
		
		ret = Tapi_SendSmsEx(stUserinfo.szSos_SmsNum3, stUserinfo.szpda_ip, szMsg, Str_Len(szMsg) );
		
		if(ret != 0)
		{
			switch(ret)
			{
				case -1:
					MessageBoxEx (WARNING_OK, "메시지 받을 전화 번호가 잘못되었습니다.");
					return ret;
				case -2:
					MessageBoxEx (WARNING_OK, "응답을 받을 전화번호가 잘못되었습니다.");
					return ret;
				case -3:
					MessageBoxEx (WARNING_OK, "내용이 비었습니다.");
					return ret;
				case -4:
					MessageBoxEx (WARNING_OK, "내용이 너무 깁니다.");
					return ret;
				default:
					MessageBoxEx (WARNING_OK, "메세지 전송에 실패했습니다.");
					return ret;
			}
		}
		
		VmSleep(lTime);
		
		/***************************/
		/* 4번째 전화걸기(112)     */
		/***************************/
		Str_Chg(stUserinfo.szSos_TelNum, STRCHG_DEL_NONDIGIT );
		Tapi_MakeCall((byte*)stUserinfo.szSos_TelNum);
		
		return ret;
	}
	
	/*=======================================================================================
	함수명 : Clear_Flag
	기  능 : FLAG 초기화
	Param  : 
 	Return :
	========================================================================================*/
	void Clear_Flag(void)
	{
		m_lLastSave = 0;
		m_lChk = 0;	// 사용량이상세대 저장관련 chk
		m_lSmsDelFlag = 0;
		m_lSmsStsFlag = 0;
		g_lDataflag = 0;
		g_nSmsSndFlag = 0;
		
		Mem_Set( (byte*)stGm.SUBMONITOR_FLAG, 0x00, sizeof(stGm.SUBMONITOR_FLAG) );
		Str_Cpy(stGm.SUBMONITOR_FLAG, "0");
		
		Mem_Set( (byte*)g_szIndi_MtrCode, 0x00, sizeof(g_szIndi_MtrCode) );
		Mem_Set( (byte*)g_szIndi_Qty, 0x00, sizeof(g_szIndi_Qty) );
		Mem_Set( (byte*)g_szIndi_Vc, 0x00, sizeof(g_szIndi_Vc) );
		Mem_Set( (byte*)g_szIndi_Vm, 0x00, sizeof(g_szIndi_Vm) );
		Mem_Set( (byte*)g_szIndi_Va, 0x00, sizeof(g_szIndi_Va) );
		Mem_Set( (byte*)m_szIndiQty, 0x00, sizeof(m_szIndiQty) );
	}
	
	/*=======================================================================================
	함수명 : JCHM_DRAW
	기  능 : 상세지침 내역 DRAW
	Param  : 
 	Return :
	========================================================================================*/
	void JCHM_DRAW(void)
	{
		if( m_bFirst == INIT_JCHM )
		{
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA25), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA26), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA27), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA28), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA29), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA30), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA31), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA32), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA33), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA34), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA35), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA36), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA30), stGm.BEFO_MM_INDI_COMPENS_VC_1);
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA34), stGm.BEFO_MM_USE_QTY_1);
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA31), stGm.BEFO_MM_INDI_COMPENS_VC_2);
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA35), stGm.BEFO_MM_USE_QTY_2);
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA32), stGm.BEFO_YY_COMPENS_VC);
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA36), stGm.BEFO_YM_USE_QTY);
		}
		else if( m_bFirst == INIT_BJCHM )
		{
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA37), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA38), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA39), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA40), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA41), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA42), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA43), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA44), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA45), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA46), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA47), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA48), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA49), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA50), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA51), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA52), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA53), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA54), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA55), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA56), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
			
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA42), stGm.BEFO_MM_INDI_COMPENS_VC_1);
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA43), stGm.BEFO_MM_INDI_COMPENS_VC_2);
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA44), stGm.BEFO_YY_COMPENS_VC);
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA46), stGm.BEFO_MM_INDI_COMPENS_VA_1);
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA47), stGm.BEFO_MM_INDI_COMPENS_VA_2);
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA48), stGm.BEFO_YY_COMPENS_VA);
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA50), stGm.BEFO_MM_INDI_MTR_1);
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA51), stGm.BEFO_MM_INDI_MTR_2);
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA52), stGm.BEFO_YY_MTR);
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA54), stGm.BEFO_MM_USE_QTY_1);
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA55), stGm.BEFO_MM_USE_QTY_2);
			EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA56), stGm.BEFO_YM_USE_QTY);
		}
	}
	
	/*=======================================================================================
	함수명 : NUM_DRAW
	기  능 : 상시계수 DRAW
	Param  : 
 	Return :
	========================================================================================*/
	void NUM_DRAW(void)
	{
		EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA57), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
		EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA58), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
		EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA59), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
		EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA60), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
		EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_DATA61), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
		EditCtrl_SetAlign( Get_hDlgCtrlByID(EDT_DATA4), EDITALIGN_MIDDLE);
		EditCtrl_SetAlign( Get_hDlgCtrlByID(EDT_DATA5), EDITALIGN_MIDDLE);
		EditCtrl_SetAlign( Get_hDlgCtrlByID(EDT_DATA6), EDITALIGN_MIDDLE);
		
		if( Str_Cmp(stGm.GMTR_OBJ_FLAG, "40") == 0 )
		{
			EditCtrl_SetStr( Get_hDlgCtrlByID(EDT_DATA4), stGm.CURR_TEMPER );
			EditCtrl_SetStr( Get_hDlgCtrlByID(EDT_DATA6), stGm.CURR_REVIS_PARA );
			
			DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_DATA5), FALSE );
			DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_DATA5), TRUE );
		}
		else
		{
			EditCtrl_SetStr( Get_hDlgCtrlByID(EDT_DATA4), stGm.CURR_TEMPER );
			EditCtrl_SetStr( Get_hDlgCtrlByID(EDT_DATA5), stGm.CURR_PRES );
			EditCtrl_SetStr( Get_hDlgCtrlByID(EDT_DATA6), stGm.CURR_REVIS_PARA );
			
			DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_DATA5), TRUE );
			DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_DATA5), FALSE );
		}
		
		// 사진 버튼 VC
		if( Str_Cmp(stGm.PHOTO_COMPENS_VC_YN, "Y") == 0 )
		{
			ButCtrl_SetBkColorEx( Get_hDlgCtrlByID(BID_PHOTO_VC), RED );
			ButCtrl_SetForeColorEx( Get_hDlgCtrlByID(BID_PHOTO_VC), BTNMENUFRCOLOR );
		}
		else if( Str_Cmp(stGm.PHOTO_COMPENS_VC_YN, "S") == 0 )
		{
			ButCtrl_SetBkColorEx( Get_hDlgCtrlByID(BID_PHOTO_VC), GREEN );
			ButCtrl_SetForeColorEx( Get_hDlgCtrlByID(BID_PHOTO_VC), BTNMENUFRCOLOR );
		}
		else
		{
			ButCtrl_SetBkColorEx( Get_hDlgCtrlByID(BID_PHOTO_VC), YELLOW );
			ButCtrl_SetForeColorEx( Get_hDlgCtrlByID(BID_PHOTO_VC), TXTFRCOLOR );
		}
		
		// 사진 버튼 VA
		if( Str_Cmp(stGm.PHOTO_COMPENS_VA_YN, "Y") == 0 )
		{
			ButCtrl_SetBkColorEx( Get_hDlgCtrlByID(BID_PHOTO_VA), RED );
			ButCtrl_SetForeColorEx( Get_hDlgCtrlByID(BID_PHOTO_VA), BTNMENUFRCOLOR );
		}
		else if( Str_Cmp(stGm.PHOTO_COMPENS_VA_YN, "S") == 0 )
		{
			ButCtrl_SetBkColorEx( Get_hDlgCtrlByID(BID_PHOTO_VA), GREEN );
			ButCtrl_SetForeColorEx( Get_hDlgCtrlByID(BID_PHOTO_VA), BTNMENUFRCOLOR );
		}
		else
		{
			ButCtrl_SetBkColorEx( Get_hDlgCtrlByID(BID_PHOTO_VA), YELLOW );
			ButCtrl_SetForeColorEx( Get_hDlgCtrlByID(BID_PHOTO_VA), TXTFRCOLOR );
		}
		
		// 사진 버튼 VM
		if( Str_Cmp(stGm.PHOTO_COMPENS_VM_YN, "Y") == 0 )
		{
			ButCtrl_SetBkColorEx( Get_hDlgCtrlByID(BID_PHOTO_VM), RED );
			ButCtrl_SetForeColorEx( Get_hDlgCtrlByID(BID_PHOTO_VM), BTNMENUFRCOLOR );
		}
		else if( Str_Cmp(stGm.PHOTO_COMPENS_VM_YN, "S") == 0 )
		{
			ButCtrl_SetBkColorEx( Get_hDlgCtrlByID(BID_PHOTO_VM), GREEN );
			ButCtrl_SetForeColorEx( Get_hDlgCtrlByID(BID_PHOTO_VM), BTNMENUFRCOLOR );
		}
		else
		{
			ButCtrl_SetBkColorEx( Get_hDlgCtrlByID(BID_PHOTO_VM), YELLOW );
			ButCtrl_SetForeColorEx( Get_hDlgCtrlByID(BID_PHOTO_VM), TXTFRCOLOR );
		}
		
		ON_DRAW();
	}
	
	/*=======================================================================================
	함수명 : COMPENSREMOVE_DRAW
	기  능 : 보정기 삭제 DRAW
	Param  : 
 	Return :
	========================================================================================*/
	void COMPENSREMOVE_DRAW(void)
	{
		char szMsg[500];
		char szAddr[500];
		char szMtr_Num[20];
		char szTmp[500];
		long lLen = 0;
		
		/********************************/
		/* Style Setting                */
		/********************************/
		EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_COMPENS_MAIN), EDITALIGN_MIDDLE|EDITALIGN_LEFT);
		EditCtrl_SetAlign( Get_hDlgCtrlByID(TXT_COMPENS_CONF_NM), EDITALIGN_MIDDLE|EDITALIGN_CENTER);
		EditCtrl_SetMultiLine(Get_hDlgCtrlByID(TXT_COMPENS_MAIN), TRUE, 2, EDITSEP_NONE );
		
		/********************************/
		/* 주소                         */
		/********************************/
		Mem_Set((byte *)szAddr, 0x00, sizeof(szAddr));
		
		if( g_nAddrFlag == 0)
		{
			if(Str_Len(stGm.TOWN) > 0)
			{
				Str_Cpy(szAddr,  stGm.TOWN );
			}
			else
			{
				Str_Cpy(szAddr,  "" );
			}
			if(Str_Len(stGm.VILLAGE) > 0)
			{
				Str_Cat(szAddr,  " " );
				Str_Cat(szAddr,  stGm.VILLAGE );
			}
			if(Str_Len(stGm.ADDR1_M) > 0)
			{
				Str_Cat(szAddr,  " " );
				Str_Cat(szAddr,  stGm.ADDR1_M);
			}			
			if(Str_Len(stGm.ADDR1_S) > 0)
			{
				Str_Cat(szAddr,  "-" );
				Str_Cat(szAddr,  stGm.ADDR1_S);
			}
			
			lLen = Str_Len(stGm.CO_LIVE_NM) + Str_Len(stGm.BLD_NM);

			if( lLen > 0 )
			{
				if( Str_Len(stGm.CO_LIVE_NM) > 0 )
				{
					Str_Cat(szAddr,  " " );
					Str_Cat(szAddr,  stGm.CO_LIVE_NM );
				}
				else
				{
					Str_Cat(szAddr,  "" );
				}
					
				if( Str_Len(stGm.BLD_NM) > 0 )
				{
					Str_Cat(szAddr,  " " );	
					Str_Cat(szAddr,  stGm.BLD_NM );
				}
				
				if( Str_Len(stGm.HOSU) > 0 )
				{
					Str_Cat(szAddr,  "-" );	
					Str_Cat(szAddr,  stGm.HOSU );
				}
				
				if( Str_Len(stGm.DETA_FLOOR) > 0 )
				{
					Str_Cat(szAddr,  " " );	
					Str_Cat(szAddr,  stGm.DETA_FLOOR );
				}
			}
			else
			{
				if( Str_Len(stGm.HOSU) > 0 )
				{
					Str_Cat(szAddr,  " " );
					Str_Cat(szAddr,  stGm.HOSU );
				}
				else
				{
					Str_Cat(szAddr,  "" );
				}
				
				if( Str_Len(stGm.DETA_FLOOR) > 0 )
				{
					Str_Cat(szAddr,  " " );	
					Str_Cat(szAddr,  stGm.DETA_FLOOR );
				}
			}
		}
		else
		{
			if(Str_Len(stGm.NEW_ROAD_NM) > 0)
			{
				Str_Cpy(szAddr,  stGm.NEW_ROAD_NM );
			}
			else
			{
				Str_Cpy(szAddr,  "" );
			}
			if(Str_Len(stGm.NEW_ADDR_M) > 0)
			{
				Str_Cat(szAddr,  " " );
				Str_Cat(szAddr,  stGm.NEW_ADDR_M);
			}
			if(Str_Len(stGm.NEW_ADDR_S) > 0)
			{
				Str_Cat(szAddr,  "-" );
				Str_Cat(szAddr,  stGm.NEW_ADDR_S);
			}

			if( Str_Len(stGm.CO_LIVE_NM) > 0 )
			{
				Str_Cat(szAddr,  " " );
				Str_Cat(szAddr,  stGm.CO_LIVE_NM );
			}
			else
			{
				Str_Cat(szAddr,  "" );
			}
			if( Str_Len(stGm.BLD_NM) > 0 )
			{
				Str_Cat(szAddr,  " " );	
				Str_Cat(szAddr,  stGm.BLD_NM );
			}
			if( Str_Len(stGm.HOSU) > 0 )
			{
				Str_Cat(szAddr,  "-" );	
				Str_Cat(szAddr,  stGm.HOSU );
			}
			if( Str_Len(stGm.DETA_FLOOR) > 0 )
			{
				Str_Cat(szAddr,  " " );
				Str_Cat(szAddr,  stGm.DETA_FLOOR );
			}
		}
		
		/********************************/
		/* 보정기 삭제 문구             */
		/********************************/
		// 1. 주소
		Mem_Set( (byte*)szMsg, 0x00, sizeof(szMsg) );
		Str_Cpy(szMsg, "주    소 : ");
		Str_Cat(szMsg, szAddr);
		Str_Cat(szMsg, "\n\n");
		
		// 2. 고객명
		Str_Cat(szMsg, "고객명 : ");
		Str_Cat(szMsg, stGm.CUST_NM);
		Str_Cat(szMsg, "\n\n");
		
		// 3. 상호
		if( Str_Len( stGm.FIRM_NM ) > 0 )
		{
			Str_Cat(szMsg, "상   호 : ");
			Str_Cat(szMsg, stGm.FIRM_NM);
			Str_Cat(szMsg, "\n\n");
		}
		
		// 4. 계량기번호
		Mem_Set( (byte*)szMtr_Num, 0x00, sizeof(szMtr_Num) );
		Mem_Set( (byte*)szTmp, 0x00, sizeof(szTmp) );
		
		Mem_Cpy((byte *)szMtr_Num, (byte *)stGm.MTR_NUM, 5);
		Mem_Cpy((byte *)szTmp, (byte *)stGm.MTR_NUM+5, 4);
		Str_Cat(szMtr_Num, "-");
		Str_Cat(szMtr_Num, szTmp);
		
		Str_Cat(szMsg, "계량기번호 : ");
		Str_Cat(szMsg, szMtr_Num);
		Str_Cat(szMsg, "\n\n\n\n");
		
		// 5. 문구
		Str_Cat(szMsg, " 온압 보정장치 고장으로 인해 보정장치로");
		Str_Cat(szMsg, "\n\n측정된 도시가스 공급량을 적용할 수 없음을");
		Str_Cat(szMsg, "\n\n확인했으며, 도시가스 공급규정에 따라 가스");
		Str_Cat(szMsg, "\n\n사용량을 산정합니다.");
		
		// 6. 실제 반영
		EditCtrl_SetStr( Get_hDlgCtrlByID(TXT_COMPENS_MAIN), szMsg );
		
		/********************************/
		/* 확인자                       */
		/********************************/
		Mem_Set( (byte*) szMsg, 0x00, sizeof( szMsg) );
		Mem_Set( (byte*) szTmp, 0x00, sizeof( szTmp) );
		SPRINT(szMsg, "SELECT CONF_NM FROM GUM_COMPENS_REMOVE_REQ WHERE REQ_YM = '%s' AND DEADLINE_FLAG = '%s' AND MTR_NUM = '%s'", stGm.REQ_YM, stGm.DEADLINE_FLAG, stGm.MTR_NUM);
		g_Sql_RetStr(szMsg, 10, szTmp);
		
		EditCtrl_SetStr( Get_hDlgCtrlByID(EDT_COMPENS_CONF_NM), szTmp );
		
		/********************************/
		/* 서명 버튼                    */
		/********************************/
		lLen = 0;
		
		Mem_Set( (byte*)szMsg, 0x00, sizeof(szMsg) );
		SPRINT(szMsg, "SELECT LENGTH( SIGN ) FROM GUM_COMPENS_REMOVE_REQ WHERE REQ_YM = '%s' AND DEADLINE_FLAG = '%s' AND MTR_NUM = '%s'", stGm.REQ_YM, stGm.DEADLINE_FLAG, stGm.MTR_NUM);
		g_Sql_RetInt( szMsg, &lLen );
		
		if( lLen < 100)
		{
			ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_COMPENS_SIGN), BTNCTRLBKCOLOR);
			ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_COMPENS_SIGN), BTNMENUFRCOLOR);
		}
		else
		{
			ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_COMPENS_SIGN), RED);
			ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_COMPENS_SIGN), BTNMENUFRCOLOR);
		}
		
		ON_DRAW();
	}
	
	/*=======================================================================================
	함수명 : SetTotCnt
	기  능 : 검침 대상 COUNT
	Param  : 
 	Return :
	========================================================================================*/
	void SetTotCnt(void)
	{
		char szSql[200];
		
		// 2016-05-26 Sanghyun Lee
		// 총 카운트 셋팅 , 파일에 담은 내용은 변하지 않음.
		
		// 미검침 목록(리스트)
		if( g_nWorkFlag == 103 )
		{
			Mem_Set( (byte*)szSql, 0x00, sizeof(szSql) );
			SPRINT(szSql, "SELECT COUNT(*) FROM REGUMDATA WHERE SEND_YN = 'N' OR SEND_YN = 'I' OR SEND_YN = '' OR SEND_YN IS NULL ORDER BY DONG_ORD, HOUSE_NUM_ORD, MTR_COURSE", 0, 0, 0);
			g_Sql_RetInt( szSql , &m_ltotcnt );
		}
		// 부재(리스트)
		else if( g_nWorkFlag == 104 )
		{
			Mem_Set( (byte*)szSql, 0x00, sizeof(szSql) );
			SPRINT(szSql, "SELECT COUNT(*) FROM REGUMDATA WHERE MTR_WORK_CODE = '2' ORDER BY DONG_ORD, HOUSE_NUM_ORD, MTR_COURSE", 0, 0, 0);
			g_Sql_RetInt( szSql , &m_ltotcnt );
		}
		// 나머지
		else
		{
			Mem_Set( (byte*)szSql, 0x00, sizeof(szSql) );
			SPRINT(szSql, "SELECT COUNT(*) FROM REGUMDATA ORDER BY DONG_ORD, HOUSE_NUM_ORD, MTR_COURSE ", 0, 0, 0);
			g_Sql_RetInt( szSql , &m_ltotcnt );
		}
	}
	
	/*=======================================================================================
	함수명 : Call_Tel
	기  능 : 전화걸기
	Param  : 
 	Return :
	========================================================================================*/
	void Call_Tel(void)
	{
		char szNum[15];
		Mem_Set( (byte*)szNum, 0x00, sizeof(szNum) );
		
		Str_Cpy(szNum, m_szPhone);
		Str_Chg(szNum, STRCHG_DEL_NONDIGIT );
		
		if( Str_Len(szNum) > 8 )
		{
			Tapi_MakeCall((byte*)szNum);
		}
	}
	
	/*=======================================================================================
	함수명 : RCV311324
	기  능 : 안전점검 자료 수신 일인지 체크
	Param  : 
 	Return :
	========================================================================================*/
	long RCV311324(void)
	{
		char szBuf[20];
		char sztmp[128];
		char szUrl[256];
		char* sndbuf;
		long ret;
	
		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));
		Str_ItoA(Time_GetDate(), sztmp, 10);
		
		Mem_Set((byte*)m_szObjym, 0x00, sizeof(m_szObjym));
		Mem_Set((byte*)m_szChkyear, 0x00, sizeof(m_szChkyear));
		Mem_Set((byte*)szBuf, 0x00, sizeof(szBuf));

		Mem_Cpy( (byte*)m_szObjym, (byte*)sztmp, 6 );
		Mem_Cpy( (byte*)m_szChkyear, (byte*)sztmp, 4 );
		Mem_Cpy( (byte*)szBuf, (byte*)sztmp+4, 2 );
		
		if( Str_AtoI(szBuf) < 7 )
		{
			Str_Cpy(m_szChkorder, "10");
		}
		else
		{
			Str_Cpy(m_szChkorder, "70");
		}
	
		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}		
		
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 311324, FALSE);
		
		JSON_SetValue( g_pjcomm, 'C', "chk_year",       m_szChkyear );
		JSON_SetValue( g_pjcomm, 'C', "chk_order",      m_szChkorder);
		
		sndbuf = JSON_toString(g_pjcomm);
		
		g_Save_JsonFile(sndbuf);
		
		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));	
		GET_FILENM(sztmp, SQLITE_DB);
		
		callBackfunc = TR311324;
		ret = HTTP_DownloadData(szUrl, "FR311324_IN",  "FR311324" , sndbuf, sztmp );
		return 0 ;
	}
	
	/*=======================================================================================
	함수명 : TR311324
	기  능 : RCV311324 Callback
	Param  : 
 	Return :
	========================================================================================*/
	long TR311324(void)
	{
		g_Sock_Close();

		if(g_Chk_Json(311324) >= 0)
		{
			RCV311317();
			return 1;
		}
		else
		{
			g_Sock_Close();
			return -1;
		}
	}
	
	/*=======================================================================================
	함수명 : RCV311317
	기  능 : 안전점검 자료 수신_조정기
	Param  : 
 	Return :
	========================================================================================*/
	long RCV311317(void)
	{
	char sztmp[128];
	char szUrl[256];
	char* sndbuf;
	long ret;
	long chk = 0, totcnt;
		
		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}		
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 311317, FALSE);
		
		JSON_SetValue( g_pjcomm, 'C', "gubun",        "20");		//10 : 일반점검 수신 , 20 : 검침-점검 업무이동 수신
		JSON_SetValue( g_pjcomm, 'C', "center_cd",    stUserinfo.szcenter_cd);
		JSON_SetValue( g_pjcomm, 'C', "bld_num",      stGm.BLD_NUM );
		
		sndbuf = JSON_toString(g_pjcomm);
		
		g_SeverConnection();
		
		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));	
		GET_FILENM(sztmp, SQLITE_DB);
		
		callBackfunc = TR311317; //통신완료 후에 호출 함수
		ret = HTTP_DownloadData(szUrl, "FR311317_IN",  "FR311317" , sndbuf, sztmp );
		return 0 ;
	}
	
	/*=======================================================================================
	함수명 : TR311317
	기  능 : TR311317 Callback
	Param  : 
 	Return :
	========================================================================================*/
	long TR311317(void)
	{
		if(g_Chk_Json(311317) >= 0)
		{
			RCV311318();
			return 1;
		}
		else
		{
			g_Sock_Close();
			return -1;
		}
	}
	
	/*=======================================================================================
	함수명 : RCV311318
	기  능 : 안전점검 자료 수신_조정기
	Param  : 
 	Return :
	========================================================================================*/
	long RCV311318(void)
	{
	char sztmp[128];
	char szUrl[256];
	char* sndbuf;
	long ret;
	
		Mem_Set((byte*)m_szZonemanagenum, 0x00, sizeof(m_szZonemanagenum));	
		g_Sql_RetStr("SELECT PARAM6 FROM RCV_LOG WHERE GUBUN = '10'", 4, m_szZonemanagenum);
	
		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}		
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 311318, FALSE);
		
		JSON_SetValue( g_pjcomm, 'C', "gubun",        "20");		//10 : 일반점검 수신 , 20 : 검침-점검 업무이동 수신
		JSON_SetValue( g_pjcomm, 'C', "center_cd",    stUserinfo.szcenter_cd );
		JSON_SetValue( g_pjcomm, 'C', "bld_num",      stGm.BLD_NUM);
		
		sndbuf = JSON_toString(g_pjcomm);
		
		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));	
		GET_FILENM(sztmp, SQLITE_DB);
		
		callBackfunc = TR311318; //통신완료 후에 호출 함수
		ret = HTTP_DownloadData(szUrl, "FR311318_IN",  "FR311318" , sndbuf, sztmp );
		return 0 ;
	}
	
	/*=======================================================================================
	함수명 : TR311318
	기  능 : RCV311318 Callback
	Param  : 
 	Return :
	========================================================================================*/
	long TR311318(void)
	{
		g_Sock_Close();
		
		if(g_Chk_Json(311318) >= 0)
		{
			RCV311311();
			return 1;
		}
		else
		{
			g_Sock_Close();
			return -1;
		}
	}
	
	/*=======================================================================================
	함수명 : RCV311311
	기  능 : 안전점검 자료 수신
	Param  : 
	Return :
	========================================================================================*/
	long RCV311311(void)
	{
	char sztmp[128];
	char szUrl[256];
	char* sndbuf;
	long ret;
		
		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}	
			
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 311311, FALSE);
		
		JSON_SetValue( g_pjcomm, 'C', "gubun",        "20");		//10 : 일반점검 수신 , 20 : 검침-점검 업무이동 수신
		JSON_SetValue( g_pjcomm, 'C', "chk_year",   m_szChkyear);
		JSON_SetValue( g_pjcomm, 'C', "chk_order",  m_szChkorder );
		JSON_SetValue( g_pjcomm, 'C', "obj_ym",     m_szObjym);
		JSON_SetValue( g_pjcomm, 'C', "center_cd",  stUserinfo.szcenter_cd);
		JSON_SetValue( g_pjcomm, 'C', "bld_num",    stGm.BLD_NUM);
		JSON_SetValue( g_pjcomm, 'C', "mtr_num",    stGm.MTR_NUM);
		
		sndbuf = JSON_toString(g_pjcomm);
		
		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));	
		GET_FILENM(sztmp, SQLITE_DB);
		
		g_Save_JsonFile(sndbuf);
		
		callBackfunc = TR311311; //통신완료 후에 호출 함수
		ret = HTTP_DownloadData(szUrl, "FR311311_IN",  "FR311311" , sndbuf, sztmp );
		return 0 ;
	}
	
	/*=======================================================================================
	함수명 : TR311317
	기  능 : TR311317 Callback
	Param  : 
	Return :
	========================================================================================*/
	long TR311311(void)
	{
		if(g_Chk_Json(311311) >= 0)
		{
			RCV311312();
			return 1;
		}
		else
		{
			g_Sock_Close();
			return -1;
		}
	}
	
	/*=======================================================================================
	함수명 : RCV311312
	기  능 : 안전점검 자료 수신
	Param  : 
	Return :
	========================================================================================*/
	long RCV311312(void)
	{
	char sztmp[128];
	char szUrl[256];
	char* sndbuf;
	long ret;
	
		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}		
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 311312, FALSE);
		
		JSON_SetValue( g_pjcomm, 'C', "gubun",        "20");		//10 : 일반점검 수신 , 20 : 검침-점검 업무이동 수신
		JSON_SetValue( g_pjcomm, 'C', "chk_year",   m_szChkyear);
		JSON_SetValue( g_pjcomm, 'C', "chk_order",  m_szChkorder );
		JSON_SetValue( g_pjcomm, 'C', "obj_ym",     m_szObjym);
		JSON_SetValue( g_pjcomm, 'C', "center_cd",  stUserinfo.szcenter_cd);
		JSON_SetValue( g_pjcomm, 'C', "bld_num",    stGm.BLD_NUM);
		JSON_SetValue( g_pjcomm, 'C', "mtr_num",    stGm.MTR_NUM);
		
		sndbuf = JSON_toString(g_pjcomm);
		
		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));	
		GET_FILENM(sztmp, SQLITE_DB);
		
		callBackfunc = TR311312; //통신완료 후에 호출 함수
		ret = HTTP_DownloadData(szUrl, "FR311312_IN",  "FR311312" , sndbuf, sztmp );
		return 0 ;
	}
	
	/*=======================================================================================
	함수명 : TR311312
	기  능 : TR311312 Callback
	Param  : 
	Return :
	========================================================================================*/
	long TR311312(void)
	{
		if(g_Chk_Json(311312) >= 0)
		{
			RCV311313();
			return 1;
		}
		else
		{
			g_Sock_Close();
			return -1;
		}
	}
	
	/*=======================================================================================
	함수명 : RCV311313
	기  능 : 안전점검 자료 수신
	Param  : 
	Return :
	========================================================================================*/
	long RCV311313(void)
	{
	char sztmp[128];
	char szUrl[256];
	char* sndbuf;
	long ret;
	
		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}	
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 311313, FALSE);
		
		JSON_SetValue( g_pjcomm, 'C', "gubun",        "20");		//10 : 일반점검 수신 , 20 : 검침-점검 업무이동 수신
		JSON_SetValue( g_pjcomm, 'C', "chk_year",   m_szChkyear);
		JSON_SetValue( g_pjcomm, 'C', "chk_order",  m_szChkorder );
		JSON_SetValue( g_pjcomm, 'C', "obj_ym",     m_szObjym);
		JSON_SetValue( g_pjcomm, 'C', "center_cd",  stUserinfo.szcenter_cd);
		JSON_SetValue( g_pjcomm, 'C', "bld_num",    stGm.BLD_NUM);
		JSON_SetValue( g_pjcomm, 'C', "mtr_num",    stGm.MTR_NUM);
		
		sndbuf = JSON_toString(g_pjcomm);
		
		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));	
		GET_FILENM(sztmp, SQLITE_DB);
		
		callBackfunc = TR311313; //통신완료 후에 호출 함수
		ret = HTTP_DownloadData(szUrl, "FR311313_IN",  "FR311313" , sndbuf, sztmp );
		return 0 ;
	}
	
	/*=======================================================================================
	함수명 : TR311313
	기  능 : TR311313 Callback
	Param  : 
	Return :
	========================================================================================*/
	long TR311313(void)
	{
		if(g_Chk_Json(311313) >= 0)
		{
			RCV311314();
			return 1;
		}
		else
		{
			g_Sock_Close();
			return -1;
		}
	}
	
	/*=======================================================================================
	함수명 : RCV311314
	기  능 : 안전점검 자료 수신
	Param  : 
	Return :
	========================================================================================*/
	long RCV311314(void)
	{
	char sztmp[128];
	char szUrl[256];
	char* sndbuf;
	long ret;
	
		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}		
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 311314, FALSE);
		
		JSON_SetValue( g_pjcomm, 'C', "gubun",        "20");		//10 : 일반점검 수신 , 20 : 검침-점검 업무이동 수신
		JSON_SetValue( g_pjcomm, 'C', "chk_year",   m_szChkyear);
		JSON_SetValue( g_pjcomm, 'C', "chk_order",  m_szChkorder );
		JSON_SetValue( g_pjcomm, 'C', "obj_ym",     m_szObjym);
		JSON_SetValue( g_pjcomm, 'C', "center_cd",  stUserinfo.szcenter_cd);
		JSON_SetValue( g_pjcomm, 'C', "bld_num",    stGm.BLD_NUM);
		JSON_SetValue( g_pjcomm, 'C', "mtr_num",    stGm.MTR_NUM);
		
		sndbuf = JSON_toString(g_pjcomm);
		
		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));	
		GET_FILENM(sztmp, SQLITE_DB);
		
		callBackfunc = TR311314; //통신완료 후에 호출 함수
		ret = HTTP_DownloadData(szUrl, "FR311314_IN",  "FR311314" , sndbuf, sztmp );
		return 0 ;
	}
	
	/*=======================================================================================
	함수명 : TR311314
	기  능 : TR311317 Callback
	Param  : 
	Return :
	========================================================================================*/
	long TR311314(void)
	{
	char szSql[256];
	
		if(g_Chk_Json(311314) >= 0)
		{
			//조건절 넣어줘야함
			Mem_Set((byte*)szSql ,0x00, sizeof(szSql) );
			SPRINT(szSql, " UPDATE NORMAL_ADDR SET BEFO_ADDR1_M = ADDR1_M, BEFO_ADDR1_S = ADDR1_S, BEFO_NEW_ADDR_M = NEW_ADDR_M, BEFO_NEW_ADDR_S = NEW_ADDR_S ", 0, 0, 0);
			g_Sql_DirectExecute( szSql );
		
			RCV311315();
			return 1;
		}
		else
		{
			g_Sock_Close();
			return -1;
		}
	}

	/*=======================================================================================
	함수명 : RCV311315
	기  능 : 안전점검 자료 수신
	Param  : 
	Return :
	========================================================================================*/
	long RCV311315(void)
	{
	char sztmp[128];
	char szUrl[256];
	char* sndbuf;
	long ret;
	
		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 311315, FALSE);

		JSON_SetValue( g_pjcomm, 'C', "gubun",        "20");		//10 : 일반점검 수신 , 20 : 검침-점검 업무이동 수신
		JSON_SetValue( g_pjcomm, 'C', "chk_year",   m_szChkyear);
		JSON_SetValue( g_pjcomm, 'C', "chk_order",  m_szChkorder );
		JSON_SetValue( g_pjcomm, 'C', "obj_ym",     m_szObjym);
		JSON_SetValue( g_pjcomm, 'C', "center_cd",  stUserinfo.szcenter_cd);
		JSON_SetValue( g_pjcomm, 'C', "bld_num",    stGm.BLD_NUM);
		JSON_SetValue( g_pjcomm, 'C', "mtr_num",    stGm.MTR_NUM);
		
		sndbuf = JSON_toString(g_pjcomm);
		
		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));	
		GET_FILENM(sztmp, SQLITE_DB);
		
		callBackfunc = TR311315; //통신완료 후에 호출 함수
		ret = HTTP_DownloadData(szUrl, "FR311315_IN",  "FR311315" , sndbuf, sztmp );
		return 0 ;
	}
	
	/*=======================================================================================
	함수명 : TR311315
	기  능 : TR311315 Callback
	Param  : 
	Return :
	========================================================================================*/
	long TR311315(void)
	{
		if(g_Chk_Json(311315) >= 0)
		{
			RCV311307();
			return 1;
		}
		else
		{
			g_Sock_Close();
			return -1;
		}
	}
	
	/*=======================================================================================
	함수명 : RCV311307
	기  능 : 안전점검 자료 수신
	Param  : 
	Return :
	========================================================================================*/
	long RCV311307(void)
	{
	char sztmp[128];
	char szUrl[256];
	char* sndbuf;
	long ret;
	
		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}		
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 311307, FALSE);

		JSON_SetValue( g_pjcomm, 'C', "gubun",        "20");		//10 : 일반점검 수신 , 20 : 검침-점검 업무이동 수신
		JSON_SetValue( g_pjcomm, 'C', "chk_year",   m_szChkyear);
		JSON_SetValue( g_pjcomm, 'C', "chk_order",  m_szChkorder );
		JSON_SetValue( g_pjcomm, 'C', "obj_ym",     m_szObjym);
		JSON_SetValue( g_pjcomm, 'C', "center_cd",  stUserinfo.szcenter_cd);
		JSON_SetValue( g_pjcomm, 'C', "bld_num",    stGm.BLD_NUM);
		JSON_SetValue( g_pjcomm, 'C', "mtr_num",    stGm.MTR_NUM);
		
		sndbuf = JSON_toString(g_pjcomm);
		
		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));	
		GET_FILENM(sztmp, SQLITE_DB);
		
		callBackfunc = TR311307; //통신완료 후에 호출 함수
		ret = HTTP_DownloadData(szUrl, "FR311307_IN",  "FR311307" , sndbuf, sztmp );
		return 0 ;
	}
	
	/*=======================================================================================
	함수명 : TR311317
	기  능 : TR311317 Callback
	Param  : 
	Return :
	========================================================================================*/
	long TR311307(void)
	{
		if(g_Chk_Json(311307) >= 0)
		{
			RCV311308();
			return 1;
		}
		else
		{
			g_Sock_Close();
			return -1;
		}
	}
	
	/*=======================================================================================
	함수명 : RCV311308
	기  능 : 안전점검 자료 수신
	Param  : 
	Return :
	========================================================================================*/
	long RCV311308(void)
	{
	char sztmp[128];
	char szUrl[256];
	char* sndbuf;
	long ret;
	
		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}		
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 311308, FALSE);
		
		JSON_SetValue( g_pjcomm, 'C', "gubun",        "20");		//10 : 일반점검 수신 , 20 : 검침-점검 업무이동 수신
		JSON_SetValue( g_pjcomm, 'C', "chk_year",   m_szChkyear);
		JSON_SetValue( g_pjcomm, 'C', "chk_order",  m_szChkorder );
		JSON_SetValue( g_pjcomm, 'C', "center_cd",  stUserinfo.szcenter_cd);
		JSON_SetValue( g_pjcomm, 'C', "bld_num",    stGm.BLD_NUM);
		JSON_SetValue( g_pjcomm, 'C', "mtr_num",    stGm.MTR_NUM);
		
		sndbuf = JSON_toString(g_pjcomm);
		
		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));	
		GET_FILENM(sztmp, SQLITE_DB);
		
		callBackfunc = TR311308; //통신완료 후에 호출 함수
		ret = HTTP_DownloadData(szUrl, "FR311308_IN",  "FR311308" , sndbuf, sztmp );
		return 0 ;
	}
	
	/*=======================================================================================
	함수명 : TR311308
	기  능 : TR311308 Callback
	Param  : 
	Return :
	========================================================================================*/
	long TR311308(void)
	{
		if(g_Chk_Json(311308) >= 0)
		{
			RCV311309();
			return 1;
		}
		else
		{
			g_Sock_Close();
			return -1;
		}
	}
	
	/*=======================================================================================
	함수명 : RCV311309
	기  능 : 안전점검 자료 수신
	Param  : 
	Return :
	========================================================================================*/
	long RCV311309(void)
	{
	char sztmp[128];
	char szUrl[256];
	char* sndbuf;
	long ret;
	
		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}		
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 311309, FALSE);
		
		JSON_SetValue( g_pjcomm, 'C', "gubun",        "20");		//10 : 일반점검 수신 , 20 : 검침-점검 업무이동 수신
		JSON_SetValue( g_pjcomm, 'C', "chk_year",   m_szChkyear);
		JSON_SetValue( g_pjcomm, 'C', "chk_order",  m_szChkorder );
		JSON_SetValue( g_pjcomm, 'C', "center_cd",  stUserinfo.szcenter_cd);
		JSON_SetValue( g_pjcomm, 'C', "bld_num",    stGm.BLD_NUM);
		JSON_SetValue( g_pjcomm, 'C', "mtr_num",    stGm.MTR_NUM);
		
		sndbuf = JSON_toString(g_pjcomm);
		
		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));	
		GET_FILENM(sztmp, SQLITE_DB);
		
		callBackfunc = TR311309; //통신완료 후에 호출 함수
		ret = HTTP_DownloadData(szUrl, "FR311309_IN",  "FR311309" , sndbuf, sztmp );
		return 0 ;
	}
	
	/*=======================================================================================
	함수명 : TR311309
	기  능 : TR311309 Callback
	Param  : 
	Return :
	========================================================================================*/
	long TR311309(void)
	{
		if(g_Chk_Json(311309) >= 0)
		{
			RCV311310();
			return 1;
		}
		else
		{
			g_Sock_Close();
			return -1;
		}
	}
	
	/*=======================================================================================
	함수명 : RCV311310
	기  능 : 안전점검 자료 수신
	Param  : 
	Return :
	========================================================================================*/
	long RCV311310(void)
	{
	char sztmp[128];
	char szUrl[256];
	char* sndbuf;
	long ret;
	
		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}		
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 311310, FALSE);
		
		JSON_SetValue( g_pjcomm, 'C', "gubun",        "20");		//10 : 일반점검 수신 , 20 : 검침-점검 업무이동 수신
		JSON_SetValue( g_pjcomm, 'C', "chk_year",   m_szChkyear);
		JSON_SetValue( g_pjcomm, 'C', "chk_order",  m_szChkorder );
		JSON_SetValue( g_pjcomm, 'C', "center_cd",  stUserinfo.szcenter_cd);
		JSON_SetValue( g_pjcomm, 'C', "bld_num",    stGm.BLD_NUM);
		JSON_SetValue( g_pjcomm, 'C', "mtr_num",    stGm.MTR_NUM);
		
		sndbuf = JSON_toString(g_pjcomm);
		
		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));	
		GET_FILENM(sztmp, SQLITE_DB);
		
		callBackfunc = TR311310; //통신완료 후에 호출 함수
		ret = HTTP_DownloadData(szUrl, "FR311310_IN",  "FR311310" , sndbuf, sztmp );
		return 0 ;
	}
	
	/*=======================================================================================
	함수명 : TR311310
	기  능 : TR311310 Callback
	Param  : 
	Return :
	========================================================================================*/
	long TR311310(void)
	{
		if(g_Chk_Json(311310) >= 0)
		{
			RCV311323();
			return 1;
		}
		else
		{
			g_Sock_Close();
			return -1;
		}
	}
	
	/*=======================================================================================
	함수명 : RCV311323
	기  능 : 안전점검 자료 수신
	Param  : 
	Return :
	========================================================================================*/
	long RCV311323(void)
	{
	char sztmp[128];
	char szUrl[256];
	char* sndbuf;
	long ret;
	
		
		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 311323, FALSE);
		
		JSON_SetValue( g_pjcomm, 'C', "gubun",        "20");		//10 : 일반점검 수신 , 20 : 검침-점검 업무이동 수신
		JSON_SetValue( g_pjcomm, 'C', "chk_year",   m_szChkyear);
		JSON_SetValue( g_pjcomm, 'C', "chk_order",  m_szChkorder );
		JSON_SetValue( g_pjcomm, 'C', "center_cd",  stUserinfo.szcenter_cd);
		JSON_SetValue( g_pjcomm, 'C', "bld_num",    stGm.BLD_NUM);
		JSON_SetValue( g_pjcomm, 'C', "mtr_num",    stGm.MTR_NUM);
		
		sndbuf = JSON_toString(g_pjcomm);
		
		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));	
		GET_FILENM(sztmp, SQLITE_DB);
		
		callBackfunc = TR311323; //통신완료 후에 호출 함수
		ret = HTTP_DownloadData(szUrl, "FR311323_IN",  "FR311323" , sndbuf, sztmp );
		return 0 ;
	}
	
	/*=======================================================================================
	함수명 : TR311323
	기  능 : TR311323 Callback
	Param  : 
	Return :
	========================================================================================*/
	long TR311323(void)
	{
		long totcnt = 0;
		long Rcvcnt = 0;
		char szDate[20];
		char szSql[256];
	
		g_Sock_Close();
		
		if(g_Chk_Json(311323) >= 0)
		{
			Mem_Set( (byte*)szSql, 0x00, sizeof(szSql) );
			SPRINT(szSql, " SELECT COUNT(*) FROM NORMAL_DATA WHERE INST_PLACE_NUM = '%s'", stGm.USAGE_TITLE, 0, 0   );
			g_Sql_RetInt( szSql , &Rcvcnt );

			if( Rcvcnt > 0 )
			{
				Str_ItoA(Time_GetDate(), szDate, 10);
				g_Sql_RetInt( "SELECT COUNT(*) FROM RCV_LOG WHERE GUBUN = '2'" , &totcnt );
				if( totcnt > 0 )
				{
					Mem_Set( (byte*)szSql, 0x00, sizeof(szSql) );
					SPRINT(szSql, "UPDATE RCV_LOG SET PARAM7 = '%s' WHERE GUBUN = '2'", szDate, 0, 0);		
				}
				else
				{
					Mem_Set( (byte*)szSql, 0x00, sizeof(szSql) );
					SPRINT(szSql, "INSERT INTO RCV_LOG(GUBUN, PARAM7) VALUES('2', '%s') ", szDate, 0, 0);		
				}
				g_Sql_DirectExecute(szSql);
				
				//해당 대상 group 전체 수신 후 normal_group 테이블 update
				totcnt = 0;
				Mem_Set( (byte*)szSql, 0x00, sizeof(szSql) );
				SPRINT(szSql, "SELECT COUNT(*) FROM NORMAL_GROUP WHERE BLD_NUM = '%s'", stGm.BLD_NUM, 0, 0);		
				g_Sql_RetInt(szSql, &totcnt );
				if( totcnt > 0 )
				{
					Mem_Set( (byte*)szSql, 0x00, sizeof(szSql) );
					SPRINT(szSql, "UPDATE NORMAL_GROUP SET CHK_YN = '1', SEND_YN = 'Y' WHERE BLD_NUM = '%s'", stGm.BLD_NUM, 0, 0);		
					g_Sql_DirectExecute(szSql);
				}
	
				Card_Move("SC_CONFIRM");
			}
			else
			{
				MessageBoxEx(CONFIRM_OK, "당월 안전점검자료가 없습니다.");
			}
			
			return 1;
		}
		else
		{
			return -1;
		}
	}
		
	/*=======================================================================================
	함수명 : Snd_Sms_New
	기  능 : 문자검침 대상 등록 / FR25004
	Param  : 
	Return :
	========================================================================================*/
	long Snd_Sms_New(void)
	{
		char szSql[256];
		char sztmp[32];
		char szUrl[256];
		char szReqym[10];
		char szDeadlineFlag[10];
		char szPhoneNum[32];
		char szPhoneNum1[5];
		char szPhoneNum2[5];
		char szPhoneNum3[5];
		char* sndbuf;
		long ret;
		long lTelNumFlag;		// = 0 문자검침 번호 사용 , = 1 검침고객 전화번호 사용

		//2017-05-29 Sanghyun Lee
		//문자검침 전화번호 확인 순서 : 문자검침 등록 전화번호 확인 -> 검침대상 기본 전화번호 확인 
		Mem_Set( (byte*) szPhoneNum, 0x00, sizeof( szPhoneNum) );
		Mem_Set( (byte*) szPhoneNum1, 0x00, sizeof( szPhoneNum1) );
		Mem_Set( (byte*) szPhoneNum2, 0x00, sizeof( szPhoneNum2) );
		Mem_Set( (byte*) szPhoneNum3, 0x00, sizeof( szPhoneNum3) );
		
		Str_Cpy(szPhoneNum, stGm.SMS_CP_DDD);
		Str_Cat(szPhoneNum, stGm.SMS_CP_EXN);
		Str_Cat(szPhoneNum, stGm.SMS_CP_NUM);
		
		ret = Analy_Phone(szPhoneNum, szPhoneNum1, szPhoneNum2, szPhoneNum3 );
		
		lTelNumFlag = 0;
		
		if(ret < 0)
		{
			Mem_Set( (byte*) szPhoneNum, 0x00, sizeof( szPhoneNum) );
			Mem_Set( (byte*) szPhoneNum1, 0x00, sizeof( szPhoneNum1) );
			Mem_Set( (byte*) szPhoneNum2, 0x00, sizeof( szPhoneNum2) );
			Mem_Set( (byte*) szPhoneNum3, 0x00, sizeof( szPhoneNum3) );
			
			Str_Cpy(szPhoneNum, stGm.CP_DDD);
			Str_Cat(szPhoneNum, stGm.CP_EXN);
			Str_Cat(szPhoneNum, stGm.CP_NUM);
			
			ret = Analy_Phone(szPhoneNum, szPhoneNum1, szPhoneNum2, szPhoneNum3 );
			
			lTelNumFlag = 1;
			
			if( ret < 0 )
			{
				MessageBoxEx (CONFIRM_OK, "전화번호를 등록해주세요.");
				return 0;
			}
		}

		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}	
			
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 25004, FALSE);

		Mem_Set( (byte*) szSql, 0x00, sizeof( szSql) );
		Mem_Set( (byte*) szReqym, 0x00, sizeof( szReqym) );
		SPRINT( szSql, "SELECT PARAM1 FROM RCV_LOG WHERE GUBUN = '10' ", 0, 0, 0 );
		g_Sql_RetStr(szSql, 10, szReqym);
		
		Mem_Set( (byte*) szSql, 0x00, sizeof( szSql) );
		Mem_Set((byte*)szDeadlineFlag, 0x00, sizeof(szDeadlineFlag));	
		SPRINT( szSql, "SELECT PARAM2 FROM RCV_LOG WHERE GUBUN = '10' ", 0, 0, 0 );
		g_Sql_RetStr(szSql, 10, szDeadlineFlag);
		
		JSON_SetValue( g_pjcomm, 'C', "gubun",        		"I" );
		JSON_SetValue( g_pjcomm, 'C', "req_ym",        		szReqym );
		JSON_SetValue( g_pjcomm, 'C', "deadline_flag",      szDeadlineFlag );
		JSON_SetValue( g_pjcomm, 'C', "use_cont_num",       stGm.USE_CONT_NUM );
		
		if( lTelNumFlag == 0 )
		{
			JSON_SetValue( g_pjcomm, 'C', "receiver_tel_ddd",        		stGm.SMS_CP_DDD );
			JSON_SetValue( g_pjcomm, 'C', "receiver_tel_exn",        		stGm.SMS_CP_EXN );
			JSON_SetValue( g_pjcomm, 'C', "receiver_tel_num",        	    stGm.SMS_CP_NUM );
		}
		else
		{
			JSON_SetValue( g_pjcomm, 'C', "receiver_tel_ddd",        		stGm.CP_DDD );
			JSON_SetValue( g_pjcomm, 'C', "receiver_tel_exn",        		stGm.CP_EXN );
			JSON_SetValue( g_pjcomm, 'C', "receiver_tel_num",        	    stGm.CP_NUM );
		}
		
		JSON_SetValue( g_pjcomm, 'C', "cust_num",        	stGm.CUST_NUM );
		JSON_SetValue( g_pjcomm, 'C', "center_cd",        	stUserinfo.szcenter_cd );
		JSON_SetValue( g_pjcomm, 'C', "send_type",        	"10" );	//10 : 개인 , 20 : 그룹
		JSON_SetValue( g_pjcomm, 'C', "nonpay_manage_sec",  stGm.NONPAY_MANAGE_SEC );

		sndbuf = JSON_toString(g_pjcomm);

		g_Save_JsonFile(sndbuf);
		
		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));	
		GET_FILENM(sztmp, SQLITE_DB);
		
		callBackfunc = TR25004; //통신완료 후에 호출 함수
		ret = HTTP_DownloadData(szUrl, "FR25004_IN",  "FR25004" , sndbuf, sztmp );
		return 0 ;
	}

	/*=======================================================================================
	함수명 : TR25004
	기  능 : TR25004 Callback
	Param  : 
	Return :
	========================================================================================*/
	long TR25004(void)
	{
		long ntotcnt = 0, i = 0;
		char szIndi_VM[10];		//당월 VM 지침 
		char szIndi_VA[10];		//당월 VA지침 
		char szIndi_VC[10];		//당월 VC지침
		char szIndi_Qty[10];
		char szDate[20];
		char szTmp[256];
		
		if( g_Chk_Json(25004) >= 0)
		{
			// 지침
			Mem_Set((byte *)stGm.INDI_SET_VM, 0x00, sizeof(stGm.INDI_SET_VM));
			Mem_Set((byte *)stGm.INDI_SET_VA, 0x00, sizeof(stGm.INDI_SET_VA));
			Mem_Set((byte *)stGm.INDI_SET_VC, 0x00, sizeof(stGm.INDI_SET_VC));
			Mem_Set((byte *)stGm.INDI_QTY, 0x00, sizeof(stGm.INDI_QTY));
			Mem_Set((byte *)m_szMtr_Code, 0x00, sizeof(m_szMtr_Code));
			Mem_Set((byte *)stGm.MTR_WORK_CODE, 0x00, sizeof(stGm.MTR_WORK_CODE));
				
			i = SearchStr( EditCtrl_GetStr(Get_hDlgCtrlByID(CMB_RESULT)), RE_GM_CODE );
			if (i == -1)
			{
				Str_Cpy(m_szMtr_Code, "");
			}
			else
			{
				Str_Cpy(m_szMtr_Code, RE_GM_CODE[i].Code);
			}

			Str_Cpy(stGm.MTR_WORK_CODE, m_szMtr_Code);		
			Str_Cpy(stGm.INDI_SET_VM, "");			
			Str_Cpy(stGm.INDI_SET_VA, "");			
			Str_Cpy(stGm.INDI_SET_VC, "");			
			Str_Cpy(stGm.INDI_QTY, "");			

			// 날짜
			Mem_Set((byte *)szDate, 0x00, sizeof(szDate));
			Mem_Set((byte *)szTmp, 0x00, sizeof(szTmp));
			Mem_Set((byte *)szTmp, 0x00, sizeof(szTmp));
			Mem_Set((byte *)stGm.INDI_DATE, 0x00, sizeof(stGm.INDI_DATE));
			Mem_Set((byte *)stGm.SMS_GMTR_MAN_YN, 0x00, sizeof(stGm.SMS_GMTR_MAN_YN));
			
			Str_ItoA(Time_GetDate(), szDate,10);
			g_Str_TimeType( szTmp , Time_GetTime());
			Str_Cat(szDate, szTmp);
			
			Str_Cpy(stGm.INDI_DATE, szDate);
			Str_Cpy(stGm.SMS_GMTR_MAN_YN, "Y");

			if( Save_Gm() > 0 )
			{
				if( 10 == m_lUserData )
				{
					Mem_Set((byte *)g_szMtr_Code, 0x00, sizeof(g_szMtr_Code));
					Str_Cpy(g_szMtr_Code, stGm.MTR_WORK_CODE);
				}
				
				g_nBackFlag++;
				
				if( g_nBackFlag > 99)
				{
					g_Db_Backup();
					g_nBackFlag = 0;
				}
	
				Next_Gm();
				Set_Index();
			}

			return 1;	
		}
		else
		{
			g_Sock_Close();
			
			ON_DRAW();
			return -1;
		}
	}

	/*=======================================================================================
	함수명 : Snd_Reserve_Cancel
	기  능 : 문자검침 예약 취소 / FR25006
	Param  : 
	Return :
	========================================================================================*/
	long Snd_Reserve_Cancel(void)
	{
		char szTmp[500];
		char szUrl[200];
		char szbuf[128];
		char szReqym[10];
		char szDeadlineFlag[10];
		char szSmsChgWhy[10];
		char szPhoneNum[32];
		char szPhoneNum1[5];
		char szPhoneNum2[5];
		char szPhoneNum3[5];
		char* sndbuf;
		long i = 0;
		long ntotcnt = 0;
		long nLen = 0;
		long lTelNumFlag = 0, ret = 0;		// = 0 문자검침 번호 사용 , = 1 검침고객 전화번호 사용

		//2017-05-29 Sanghyun Lee
		//문자검침 전화번호 확인 순서 : 문자검침 등록 전화번호 확인 -> 검침대상 기본 전화번호 확인 
		Mem_Set( (byte*) szPhoneNum, 0x00, sizeof( szPhoneNum) );
		Mem_Set( (byte*) szPhoneNum1, 0x00, sizeof( szPhoneNum1) );
		Mem_Set( (byte*) szPhoneNum2, 0x00, sizeof( szPhoneNum2) );
		Mem_Set( (byte*) szPhoneNum3, 0x00, sizeof( szPhoneNum3) );
		
		Str_Cpy(szPhoneNum, stGm.SMS_CP_DDD);
		Str_Cat(szPhoneNum, stGm.SMS_CP_EXN);
		Str_Cat(szPhoneNum, stGm.SMS_CP_NUM);
		
		ret = Analy_Phone(szPhoneNum, szPhoneNum1, szPhoneNum2, szPhoneNum3 );
		
		lTelNumFlag = 0;
		
		if(ret < 0)
		{
			Mem_Set( (byte*) szPhoneNum, 0x00, sizeof( szPhoneNum) );
			Mem_Set( (byte*) szPhoneNum1, 0x00, sizeof( szPhoneNum1) );
			Mem_Set( (byte*) szPhoneNum2, 0x00, sizeof( szPhoneNum2) );
			Mem_Set( (byte*) szPhoneNum3, 0x00, sizeof( szPhoneNum3) );
			
			Str_Cpy(szPhoneNum, stGm.CP_DDD);
			Str_Cat(szPhoneNum, stGm.CP_EXN);
			Str_Cat(szPhoneNum, stGm.CP_NUM);
			ret = Analy_Phone(szPhoneNum, szPhoneNum1, szPhoneNum2, szPhoneNum3 );
			
			lTelNumFlag = 1;
			if( ret < 0 )
			{
				MessageBoxEx (CONFIRM_OK, "전화번호를 등록해주세요.");
				return 0;
			}
		}

		Mem_Set( (byte*) szTmp, 0x00, sizeof( szTmp) );
		Mem_Set( (byte*) szReqym, 0x00, sizeof( szReqym) );
		SPRINT( szTmp, "SELECT PARAM1 FROM RCV_LOG WHERE GUBUN = '10' ", 0, 0, 0 );
		g_Sql_RetStr(szTmp, 10, szReqym);
		
		Mem_Set( (byte*) szTmp, 0x00, sizeof( szTmp) );
		Mem_Set((byte*)szDeadlineFlag, 0x00, sizeof(szDeadlineFlag));	
		SPRINT( szTmp, "SELECT PARAM2 FROM RCV_LOG WHERE GUBUN = '10' ", 0, 0, 0 );
		g_Sql_RetStr(szTmp, 10, szDeadlineFlag);
		
		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}		
		
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 25006, FALSE);

		JSON_SetValue( g_pjcomm, 'C', "req_ym",              szReqym                );
		JSON_SetValue( g_pjcomm, 'C', "deadline_flag",       szDeadlineFlag         );
		JSON_SetValue( g_pjcomm, 'C', "use_cont_num",        stGm.USE_CONT_NUM      );
		JSON_SetValue( g_pjcomm, 'C', "sms_num",             stGm.SMS_NUM           );
		JSON_SetValue( g_pjcomm, 'C', "send_seq",            stGm.SEND_SEQ          );
		
		sndbuf = JSON_toString(g_pjcomm);
		
		//전송데이터 확인
		g_Save_JsonFile(sndbuf);

		Mem_Set((byte*)szbuf, 0x00, sizeof(szbuf));	
		GET_FILENM(szbuf, SQLITE_DB);

		callBackfunc = TR25006; //통신완료 후에 호출 함수
		HTTP_DownloadData( szUrl, "FR25006_IN",  "FR25006" , sndbuf, szbuf );

		return 1;
	}
	
	/*=======================================================================================
	함수명 : TR25006
	기  능 : TR25006 Callback
	Param  : 
	Return :
	========================================================================================*/
	long TR25006(void)
	{
		char szSql[250];
		char szTmp[100];
		long ntotcnt = 0, i = 0;

		if(g_Chk_Json(25006) >= 0)
		{
			Snd_Delete();

			ON_DRAW();
			return 1;
		}
		else
		{
			g_Sock_Close();
			CloseMessageBox();
			ON_DRAW();
			return -1;
		}
	}

	/*=======================================================================================
	함수명 : Snd_Delete
	기  능 : 문자검침 취소 / FR25005
	Param  : 
	Return :
	========================================================================================*/
	long Snd_Delete(void)
	{
		char szTmp[500];
		char szUrl[200];
		char szbuf[128];
		char szReqym[10];
		char szDeadlineFlag[10];
		char szSmsChgWhy[10];
		char* sndbuf;
		long i = 0;
		long ret = 0;
		long nLen = 0;
	
		Mem_Set( (byte*) szTmp, 0x00, sizeof( szTmp) );
		Mem_Set( (byte*) szReqym, 0x00, sizeof( szReqym) );
		SPRINT( szTmp, "SELECT PARAM1 FROM RCV_LOG WHERE GUBUN = '10' ", 0, 0, 0 );
		g_Sql_RetStr(szTmp, 10, szReqym);
		
		Mem_Set( (byte*) szTmp, 0x00, sizeof( szTmp) );
		Mem_Set((byte*)szDeadlineFlag, 0x00, sizeof(szDeadlineFlag));	
		SPRINT( szTmp, "SELECT PARAM2 FROM RCV_LOG WHERE GUBUN = '10' ", 0, 0, 0 );
		g_Sql_RetStr(szTmp, 10, szDeadlineFlag);
		
		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}		
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 25005, FALSE);

		JSON_SetValue( g_pjcomm, 'C', "req_ym",              szReqym               );
		JSON_SetValue( g_pjcomm, 'C', "deadline_flag",       szDeadlineFlag        );
		JSON_SetValue( g_pjcomm, 'C', "use_cont_num",        stGm.USE_CONT_NUM     );
				
		sndbuf = JSON_toString(g_pjcomm);
		
		//전송데이터 확인
		g_Save_JsonFile(sndbuf);

		Mem_Set((byte*)szbuf, 0x00, sizeof(szbuf));	
		GET_FILENM(szbuf, SQLITE_DB);

		callBackfunc = TR25005; //통신완료 후에 호출 함수
		HTTP_DownloadData( szUrl, "FR25005_IN",  "FR25005" , sndbuf, szbuf );

		return 1;
	}
	
	/*=======================================================================================
	함수명 : TR25005
	기  능 : TR25005 Callback
	Param  : 
	Return :
	========================================================================================*/
	long TR25005(void)
	{
		char szSql[250];
		char szTmp[100];
		long ntotcnt = 0, i = 0;

		if(g_Chk_Json(25005) >= 0 )
		{
			Mem_Set( (byte*)szSql, 0x00, sizeof(szSql) );
			SPRINT(szSql, "UPDATE REGUMDATA SET SMS_GMTR_MAN_YN = 'N' WHERE USE_CONT_NUM = '%s' ", stGm.USE_CONT_NUM, 0, 0);		
			g_Sql_DirectExecute(szSql);
			
			Str_Cpy(stGm.SMS_GMTR_MAN_YN, "N");

			//m_lSmsDelFlag = 0 default , = 1 문자대상 -> 업무 정상 등록 시 삭제 , = 2 검침취소(삭제) 시 삭제
			if( m_lSmsDelFlag == 1 )
			{
				m_lSmsDelFlag = 0;
				
				if( Save_Gm() > 0 )
				{
					if( 10 == m_lUserData )
					{
						Str_Cpy(g_szMtr_Code, stGm.MTR_WORK_CODE);
					}
					
					g_nBackFlag++;
					
					if( g_nBackFlag > 99)
					{
						g_Db_Backup();
						g_nBackFlag = 0;
					}

					//stGm.INSP_YN -> Y : 실사대상 , stGm.INSP_YN -> N : 실사대상 아님.
					if( Str_Cmp(stGm.INSP_YN, "Y") == 0 && 
					   (Str_Cmp(stGm.MTR_WORK_CODE, "1") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "3") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "A") == 0 ||
					    Str_Cmp(stGm.MTR_WORK_CODE, "B") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "C") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "D") == 0 ||
					    Str_Cmp(stGm.MTR_WORK_CODE, "5") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "6") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "7") == 0 ) )
					{
						g_nActIndex++;
						g_lindex = g_SREACHFILE_GetSeq(SREACH_FILE, g_nActIndex);
				
						if( g_nActIndex > m_ltotcnt || g_lindex < 0 )
						{
							if( g_SREACHFILE_GetSeq(SREACH_FILE, g_nActIndex) < g_nActIndex )
							{
								g_nActIndex = g_nActIndex-1;
							}
							g_lindex = g_SREACHFILE_GetSeq(SREACH_FILE, g_nActIndex);
						}

						g_lDataflag = 0;
						
						Mem_Set( (byte*)stGm.SUBMONITOR_FLAG, 0x00, sizeof(stGm.SUBMONITOR_FLAG) );
						Str_Cpy(stGm.SUBMONITOR_FLAG, "0");
						
						Mem_Set( (byte*)g_szIndi_MtrCode, 0x00, sizeof(g_szIndi_MtrCode) );
						Mem_Set( (byte*)g_szIndi_Qty, 0x00, sizeof(g_szIndi_Qty) );

						Card_Move("GM_SILSA");
					}
					else
					{
						Next_Gm();
					}
				}
				else
				{
					g_lDataflag = 1;
				}
				
				Set_Index();
			}
			else if( m_lSmsDelFlag == 2 )
			{
				m_lSmsDelFlag = 0;
				
				Del_Gm();
				SetData();
				SetStyle();
				REDRAW();

				//삭제된 정보 문자검침 대상 상태 수신
				Rcv_SmsSts();
			}

			ON_DRAW();
			return 1;
		}
		else
		{
			g_Sock_Close();
			CloseMessageBox();
			ON_DRAW();
			
			return -1;
		}
	}

	/*=======================================================================================
	함수명 : Rcv_Many
	기  능 : 문자 동의 세대 확인
	Param  : 
	Return :
	========================================================================================*/
	long Rcv_Many(void)
	{
		char sztmp[256];
		char szUrl[256];
		char szReqym[10];
		char szDeadlineFlag[10];
		char* sndbuf;
		long ret;

		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}
			
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 25010, FALSE);
		
		JSON_SetValue( g_pjcomm, 'C', "use_cont_num",        stGm.USE_CONT_NUM     );
		
		sndbuf = JSON_toString(g_pjcomm);
		
		g_Save_JsonFile(sndbuf);
		
		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));	
		GET_FILENM(sztmp, SQLITE_DB);
		
		callBackfunc = TR25010;
		ret = HTTP_DownloadData(szUrl, "FR25010_IN",  "FR25010" , sndbuf, sztmp );
		
		return 1 ;
	}

	/*=======================================================================================
	함수명 : TR25010
	기  능 : FRTR25010 CALLBACK
	Param  : 
	Return :
	========================================================================================*/
	long TR25010(void)
	{
		long lRet = -1;
		
		if( g_Chk_Json(25010) >= 0)
		{
			lRet = GmSms_Sts(25010);
			Rcv_SmsSts();
			ON_DRAW();
			return lRet;	
		}
		else
		{
			g_Sock_Close();
			ON_DRAW();
			return lRet;
		}
	}
	
	/*=======================================================================================
	함수명 : Rcv_SmsSts
	기  능 : 문자 검침 데이터 SELECT
	Param  : 
	Return :
	========================================================================================*/
	long Rcv_SmsSts(void)
	{
		char sztmp[256];
		char szUrl[256];
		char szReqym[10];
		char szDeadlineFlag[10];
		char* sndbuf;
		long ret;
		
		if( m_lSmsStsFlag == 3 )
		{
			if( Str_Cmp(stGm.MULTI_USE_CONT_YN, "Y") == 0 )
			{
				MessageBoxEx (CONFIRM_OK, "해당 세대는 복수계약 세대 입니다.\n복수계약 세대는 문자검침을 할 수 없습니다.");
				return 1;
			}
			else if( Str_Cmp(stGm.SMS_SEND_AGREE_YN, "N") == 0 )
			{
				MessageBoxEx (CONFIRM_OK, "문자검침 동의 세대가 아닙니다.");
				return 1;
			}
			else if( Str_Cmp(stGm.CONT_STS_CD, "N") == 0 )
			{
				MessageBoxEx (CONFIRM_OK, "사용계약상태가 정상이 아닙니다.");
				return 1;
			}
		}

		Mem_Set( (byte*) sztmp, 0x00, sizeof( sztmp) );
		Mem_Set( (byte*) szReqym, 0x00, sizeof( szReqym) );
		SPRINT( sztmp, "SELECT PARAM1 FROM RCV_LOG WHERE GUBUN = '10' ", 0, 0, 0 );
		g_Sql_RetStr(sztmp, 10, szReqym);
		
		Mem_Set( (byte*) sztmp, 0x00, sizeof( sztmp) );
		Mem_Set((byte*)szDeadlineFlag, 0x00, sizeof(szDeadlineFlag));	
		SPRINT( sztmp, "SELECT PARAM2 FROM RCV_LOG WHERE GUBUN = '10' ", 0, 0, 0 );
		g_Sql_RetStr(sztmp, 10, szDeadlineFlag);

		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}
				
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 25008, FALSE);
		
		JSON_SetValue( g_pjcomm, 'C', "req_ym",              szReqym               );
		JSON_SetValue( g_pjcomm, 'C', "deadline_flag",       szDeadlineFlag        );
		JSON_SetValue( g_pjcomm, 'C', "use_cont_num",        stGm.USE_CONT_NUM     );
		
		sndbuf = JSON_toString(g_pjcomm);
		
		g_Save_JsonFile(sndbuf);
		
		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));	
		GET_FILENM(sztmp, SQLITE_DB);
		
		callBackfunc = TR25008;
		ret = HTTP_DownloadData(szUrl, "FR25008_IN",  "FR25008" , sndbuf, sztmp );
		
		return 1 ;
	}

	/*=======================================================================================
	함수명 : TR25008
	기  능 : FR25008 CALLBACK
	Param  : 
	Return :
	========================================================================================*/
	long TR25008(void)
	{
		long lRet = -1;
		
		if( g_Chk_Json(25008) >= 0)
		{
			lRet = GmSms_Sts(25008);
			ON_DRAW();
			return lRet;	
		}
		else
		{
			g_Sock_Close();
			ON_DRAW();
			return lRet;
		}
	}

	/*=======================================================================================
	함수명 : GmSms_Sts
	기  능 : 문자검침 구조체 SETTING
	Param  : 
	Return :
	========================================================================================*/
	long GmSms_Sts(long nservicenum)
	{
		char szJsonpath[500];
		char szMsg[500];
		char szCol[128];
		char szTmp[100];
		long *nCol;
		long nCnt = 0;
		long fd, i;
		long chkmsg = 0;
		long chkcode = 0;
		long fsize = 0;
		long lServerDtm = 0 , lReceiveDtm = 0 , lRet = 0;
		char *pStr;
		char *szcode;
		char *szmessage;
		char *szitem;
		char *szSmsSts;
		char *szSmsdesc;
		char *szServerDtm;
		char *szPlanDtm;
		char *szAgreeYn;
		char *szContCd;
		long *nSmsnum;
		long *nSendSeq;
		char *szSendType;
		char *szGmtrSendFlag;
		char szType[2] = {0,0};
		long ret = 11;
		handle hitem = NULL;
		handle hcnt = NULL;
		
		Mem_Set( (byte*) szJsonpath, 0x00, sizeof( szJsonpath) );
		SPRINT( szJsonpath, "%sFR%d_Res.JSON",  SYSTEM_COMM, nservicenum, 0 );
		
		if( FFS_Exist(szJsonpath) != TRUE )
		{
			Mem_Set( (byte*) szJsonpath, 0x00, sizeof( szJsonpath) );
			SPRINT( szJsonpath, "%sFR%d.JSON",  SYSTEM_COMM, nservicenum, 0 );
		}
		
		fsize = FFS_GetSize(szJsonpath);
		
		if(fsize <= 15)
		{
			ret = -1;
			goto Finally;
		}
		
		pStr = Mem_Alloc(fsize);
		
		fd = FFS_Open( szJsonpath, FS_READ_MODE, FS_NORMAL_FLAG );
		
		if(fd == -1)
		{
			ret = -1;
			goto Finally;
		}

		FFS_Read(fd, (byte*)pStr, fsize);
		
		for( i = 0 ; i < fsize-9 ; i++ )
		{
			if( Mem_Cmp((byte*)pStr+i,(byte*) "\"code\"", 6) == 0  )
			{
				chkcode++;
			}
			
			if( Mem_Cmp((byte*)pStr+i,(byte*) "\"message\"", 9) == 0  )
			{
				chkmsg++;
			}
			
			if(chkmsg > 0 &&  chkcode > 0)
			{
				break;
			}
		}

		FFS_Close(fd);
		
		Mem_Free((byte*)pStr);
		
		if(chkmsg == 0 || chkcode == 0)
		{
			ret = -1;
			goto Finally;
		}
		
		if(g_pjcomm != NULL)
		{
			JSON_Finalize(g_pjcomm);
			g_pjcomm = NULL;
		}
		
		g_pjcomm = JSON_Create( JSON_Object );
		
		if(g_pjcomm == NULL)
		{
			ret = -1;
			goto Finally;
		}

		if( JSON_LoadFile(g_pjcomm, szJsonpath) > 0)
		{
			szcode    = JSON_GetValue (g_pjcomm, "code",    szType);
			szmessage = JSON_GetValue (g_pjcomm, "message", szType);

			if( Str_Cmp(szcode, "0000") != 0)
			{
				Mem_Set((byte*) szJsonpath, 0x00, sizeof( szJsonpath) );
				if(Str_Len(szmessage) < 500 )
					SQL_ConvMbStr( szMsg, szmessage);
				
				SPRINT(szJsonpath, "[%s] %s", szcode, szMsg, 0 );
			
				MessageBoxEx (WARNING_OK, szJsonpath);
				ON_DRAW();
				ret = -1;
			}
			else
			{
				ret = 0;
				szitem =JSON_GetValue(g_pjcomm, "item", szType);
				if(szitem != NULL)
				{
					if( Str_Len(szitem) > 0 )
					{
						hitem = JSON_Create( JSON_Array );
						if( hitem != NULL)
						{
							JSON_toJson(hitem, szitem ) ;
							ret = JSON_GetArrayCount( hitem );
							
							if( ret > 0 )
							{
								/***************************************************/
								/* FR25008 / 문자검침 대상 상태 및 정보 수신       */
								/***************************************************/
								if( nservicenum == 25008 )
								{
									//문자검침 대상 상태 및 정보 수신
									//수신문자내용
									Mem_Set((byte*) stGm.RCV_SMS_DESC, 0x00, sizeof( stGm.RCV_SMS_DESC) );
									szSmsdesc = (char*)JSON_GetArrayItem ( hitem, 0, "rcv_sms_desc", szType);
									SQL_ConvMbStr(stGm.RCV_SMS_DESC, szSmsdesc);
	
									//문자검침발송진행상태
									Mem_Set((byte*) stGm.GMTR_SEND_STS, 0x00, sizeof( stGm.GMTR_SEND_STS) );
									szSmsSts = (char*)JSON_GetArrayItem ( hitem, 0, "gmtr_send_sts", szType);
									Str_Cpy(stGm.GMTR_SEND_STS, szSmsSts);
									Str_Chg(stGm.GMTR_SEND_STS, STRCHG_DEL_NONDIGIT);
	
									//SMS_NUM
									Mem_Set((byte*) stGm.SMS_NUM, 0x00, sizeof( stGm.SMS_NUM) );
									nSmsnum = (long*)JSON_GetArrayItem ( hitem, 0, "sms_num", szType);
									nCnt = *nSmsnum;
									Str_ItoA(nCnt, stGm.SMS_NUM, 10);
	
									//서버시간
									Mem_Set((byte*) stGm.SERVER_DTM, 0x00, sizeof( stGm.SERVER_DTM) );
									szServerDtm = (char*)JSON_GetArrayItem ( hitem, 0, "server_dtm", szType);
									Str_Cpy(stGm.SERVER_DTM, szServerDtm);
	
									//예약시간
									Mem_Set((byte*) stGm.PLAN_DTM, 0x00, sizeof( stGm.PLAN_DTM) );
									szPlanDtm = (char*)JSON_GetArrayItem ( hitem, 0, "plan_dtm", szType);
									Str_Cpy(stGm.PLAN_DTM, szPlanDtm);
									
									//문자검침 회신검증코드
									Mem_Set((byte*) stGm.RCV_STS_VERIFY_CD, 0x00, sizeof( stGm.RCV_STS_VERIFY_CD) );
									szSmsSts = (char*)JSON_GetArrayItem ( hitem, 0, "rcv_sts_verify_cd", szType);
									Str_Cpy(stGm.RCV_STS_VERIFY_CD, szSmsSts);
									
									//stGm.SEND_SEQ
									Mem_Set((byte*) stGm.SEND_SEQ, 0x00, sizeof( stGm.SEND_SEQ) );
									nSendSeq = (long*)JSON_GetArrayItem ( hitem, 0, "send_seq", szType);
									nCnt = *nSendSeq;
									Str_ItoA(nCnt, stGm.SEND_SEQ, 10);
									
									//stGm.SEND_TYPE
									Mem_Set((byte*) stGm.SEND_TYPE, 0x00, sizeof( stGm.SEND_TYPE) );
									szSendType = (char*)JSON_GetArrayItem ( hitem, 0, "send_type", szType);
									Str_Cpy(stGm.SEND_TYPE, szSendType);	
									
									Mem_Set((byte*) stGm.GMTR_SEND_FLAG, 0x00, sizeof( stGm.GMTR_SEND_FLAG) );
									szGmtrSendFlag = (char*)JSON_GetArrayItem ( hitem, 0, "gmtr_send_flag", szType);
									Str_Cpy(stGm.GMTR_SEND_FLAG, szGmtrSendFlag);	
								}
								/***************************************************/
								/* 25010 / 복수, 동의, 사용계약상태 확인           */
								/***************************************************/
								else if( nservicenum == 25010 )
								{
									//복수세대 여부
									Mem_Set((byte*) stGm.MULTI_USE_CONT_YN, 0x00, sizeof( stGm.MULTI_USE_CONT_YN) );
									szServerDtm = (char*)JSON_GetArrayItem ( hitem, 0, "multi_use_cont_yn", szType);
									Str_Cpy(stGm.MULTI_USE_CONT_YN, szServerDtm);
									
									//문자검침 동의 여부
									Mem_Set((byte*) stGm.SMS_SEND_AGREE_YN, 0x00, sizeof( stGm.SMS_SEND_AGREE_YN) );
									szAgreeYn = (char*)JSON_GetArrayItem ( hitem, 0, "sms_send_agree_yn", szType);
									Str_Cpy(stGm.SMS_SEND_AGREE_YN, szAgreeYn);
									
									//사용계약상태
									Mem_Set((byte*) stGm.CONT_STS_CD, 0x00, sizeof( stGm.CONT_STS_CD) );
									szContCd = (char*)JSON_GetArrayItem ( hitem, 0, "cont_sts_cd", szType);
									Str_Cpy(stGm.CONT_STS_CD, szContCd);
								}
							}
							
							JSON_Finalize(hitem);
							hitem = NULL;
							
							if( nservicenum == 25010 )
							{
								goto Finally2;
							}
						}
					}
				}
			}
		}
		else
		{
			ret = 1;
		}
		
Finally:		

		//m_lSmsStsFlag = 0 문자검침 대상 상태 표시
		if( m_lSmsStsFlag == 0 )
		{
			//문자상태 버튼
			i = 0;
			i = SearchCD( stGm.GMTR_SEND_STS, GM_SEND_STS );
			
			if (i == -1 || Str_Cmp(stGm.GMTR_SEND_STS, "90") == 0)
			{
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(BID_SMS_STS), FALSE);
				ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_SMS_STS), BTNMENUFRCOLOR);
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_SMS_STS), "");

				ret = 1;
				goto Finally2;
			}
			else
			{
				DlgCtrl_SetVisible(this->m_hDlg, Get_iDlgCtrlByID(BID_SMS_STS), TRUE);
				ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_SMS_STS), RED);

				Mem_Set((byte*) szTmp, 0x00, sizeof(szTmp) );
				
				if( Str_Cmp(stGm.SEND_TYPE, "30") == 0 )
				{
					Str_Cpy(szTmp, "사전");
					ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_SMS_STS), YELLOW);
				}
				else
				{
					Str_Cpy(szTmp, "사후");
					ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_SMS_STS), BTNCTRLBKCOLOR);
				}
				
				if( Str_Cmp(stGm.GMTR_SEND_STS , "10") == 0 )
				{
					Str_Cat(szTmp, "대상");
				}
				else if( Str_Cmp(stGm.GMTR_SEND_STS , "20") == 0 || Str_Cmp(stGm.GMTR_SEND_STS , "30") == 0 || Str_Cmp(stGm.GMTR_SEND_STS , "40") == 0 )
				{
					Str_Cat(szTmp, "발송");
				}
				else if( Str_Cmp(stGm.GMTR_SEND_STS , "60") == 0 || Str_Cmp(stGm.GMTR_SEND_STS , "70") == 0 || Str_Cmp(stGm.GMTR_SEND_STS , "80") == 0 )
				{
					Str_Cat(szTmp, "회신");
					ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_SMS_STS), RED);
					ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_SMS_STS), BTNMENUFRCOLOR);
				}
				else
				{
					Str_Cat(szTmp, GM_SEND_STS[i].Str);
				}
				
				ButCtrl_SetText(Get_hDlgCtrlByID(BID_SMS_STS), szTmp);
				
			}

			if( Str_Cmp(stGm.GMTR_SEND_STS, "60") == 0 ||
			    Str_Cmp(stGm.GMTR_SEND_STS, "70") == 0 ||
			    Str_Cmp(stGm.GMTR_SEND_STS, "80") == 0 )
			{
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_SMS_STS), TRUE );

				if( Str_Cmp(stGm.INDI_SET_VC, "") == 0 && ( Str_Cmp(stGm.MTR_WORK_CODE,"2") != 0 && Str_Cmp(stGm.MTR_WORK_CODE,"C") != 0 ) )
				{
					if( Str_Cmp(stGm.GMTR_SEND_STS, "80") == 0)
					{
						// VC
						EditCtrl_SetStr( Get_hDlgCtrlByID(EDT_VC), stGm.RCV_SMS_DESC );
						
						//사용량
						Cal_UseQty( EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)) );
						
						if( m_lUserData == 10 )
						{	
							EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), m_szIndiQty);
						}
						else
						{
							EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), m_szIndiQty);
						}
					}
				}	
			}
			else
			{
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_SMS_STS), FALSE );
			}
			
			//문자 대상의 경우 -> 코드값 설정 : "L:문자발송" 기본 셋팅
			if( Str_Cmp(stGm.GMTR_SEND_STS, "") != 0 && Str_Cmp(stGm.GMTR_SEND_STS, "null") != 0 )
			{
				i = SearchCD( stGm.MTR_WORK_CODE, RE_GM_CODE );
	
				if (i == -1)
				{
					EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), RE_GM_CODE[0].Str);
					
					// 사전회신인 경우
					if( Str_Cmp(stGm.GMTR_SEND_STS, "60") == 0 ||
					    Str_Cmp(stGm.GMTR_SEND_STS, "70") == 0 ||
					    Str_Cmp(stGm.GMTR_SEND_STS, "80") == 0 )
					{
						if( Str_Cmp(stGm.INDI_SET_VC, "") == 0 && ( Str_Cmp(stGm.MTR_WORK_CODE,"2") != 0 && Str_Cmp(stGm.MTR_WORK_CODE,"C") != 0 ) && Str_Cmp(stGm.SEND_TYPE, "30") == 0  )
						{
							if( Str_Cmp(stGm.GMTR_SEND_STS, "80") == 0)
							{
								EditCtrl_SetStr( Get_hDlgCtrlByID(CMB_RESULT), "사전회신" );
							}
						}	
					}
				}
				else
				{
					EditCtrl_SetStr(Get_hDlgCtrlByID(CMB_RESULT), RE_GM_CODE[i].Str);
				}
			}

			//부재 , 없음, 문자검침
			if( ( Str_Cmp(stGm.MTR_WORK_CODE,"2") == 0 || Str_Cmp(stGm.MTR_WORK_CODE,"C") == 0 || Str_Cmp(stGm.MTR_WORK_CODE,"L") == 0 ) )
			{
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), FALSE );
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );
			}
			else
			{
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), TRUE );
				DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), TRUE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VA), FALSE );
				DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VM), FALSE );
				ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_MESSAGE), BTNMENUFRCOLOR);
				
				Dialog_SetActiveCtrl(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC) );
				m_lEditCtrlIndex = Dialog_GetActiveCtrlIndex(this->m_hDlg);
			}
		}
		else if( m_lSmsStsFlag == 1 || m_lSmsStsFlag == 2 )
		{
			if( Str_Cmp(stGm.GMTR_SEND_STS, "30") == 0 )
			{
				//예약취소
				if( nservicenum == 25008 )
				{
					lRet = 0;
					Mem_Set((byte*) szTmp, 0x00, sizeof( szTmp) );
					Str_Sub(stGm.PLAN_DTM, stGm.SERVER_DTM, szTmp);
					lRet = Str_AtoI(szTmp);
					
					if( lRet > 1000 )
					{
						//m_lSmsStsFlag = 1 문자대상 -> 업무 정상 등록 시 상태 , = 2 검침취소(삭제) 시 상태
						//m_lSmsDelFlag = 0 default , = 1 문자대상 -> 업무 정상 등록 시 삭제 , = 2 검침취소(삭제) 시 삭제
						if( m_lSmsStsFlag == 1 )
						{
							m_lSmsDelFlag = 1;
						}
						else if( m_lSmsStsFlag == 2 )
						{
							m_lSmsDelFlag = 2;
						}
						
						//문자검침 대상 예약 취소 후 삭제
						m_lSmsStsFlag = 0;
						Snd_Reserve_Cancel();
						ret = 1;
					}
					else if( lRet >= 0 && lRet < 1000 )
					{
						m_lSmsStsFlag = 0;
						Mem_Set((byte*) szTmp, 0x00, sizeof( szTmp) );
						Mem_Set((byte*) szCol, 0x00, sizeof( szCol) );
						g_Str_DateType(szCol, stGm.PLAN_DTM);
						SPRINT(szTmp, "문자발송 예약시간 10분 전에는 취소가 불가능합니다.\n[예약일자:%s]", szCol,0,0);
						MessageBoxEx (CONFIRM_OK, szTmp);
						ret = 0;
						goto Finally2;
					}
					else
					{
						//상태가 예약인데 예약시간이 지난 경우
						//1.취소 : 메세지 출력(문자발송 예약시간을 확인해주세요.\n[예약일자:%s])
						//2.정상 저장 : 일반 점검 저장 로직 실행.
						//3.정상 저장 -> 취소 : 일반 점검 저장 로직 실행.(단, 문자 상태 및 예약 시간 확인 후 취소로직 타야함. 시간확인 필요)
						if( m_lSmsStsFlag == 1 )
						{
							//위의 2번의 경우
							if( Save_Gm() > 0 )
							{
								if( 10 == m_lUserData )
								{
									Str_Cpy(g_szMtr_Code, stGm.MTR_WORK_CODE);
								}
								
								g_nBackFlag++;
								
								if( g_nBackFlag > 99)
								{
									g_Db_Backup();
									g_nBackFlag = 0;
								}
			
								//stGm.INSP_YN -> Y : 실사대상 , stGm.INSP_YN -> N : 실사대상 아님.
								if( Str_Cmp(stGm.INSP_YN, "Y") == 0 && 
								(Str_Cmp(stGm.MTR_WORK_CODE, "1") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "3") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "A") == 0 ||
								 Str_Cmp(stGm.MTR_WORK_CODE, "B") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "C") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "D") == 0 ||
								 Str_Cmp(stGm.MTR_WORK_CODE, "5") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "6") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "7") == 0 ))
								{
									g_nActIndex++;
									g_lindex = g_SREACHFILE_GetSeq(SREACH_FILE, g_nActIndex);
							
									if( g_nActIndex > m_ltotcnt || g_lindex < 0 )
									{
										if( g_SREACHFILE_GetSeq(SREACH_FILE, g_nActIndex) < g_nActIndex )
										{
											g_nActIndex = g_nActIndex-1;
										}
										g_lindex = g_SREACHFILE_GetSeq(SREACH_FILE, g_nActIndex);
									}
									
									g_lDataflag = 0;
									Str_Cpy(stGm.SUBMONITOR_FLAG, "0");
									Mem_Set( (byte*)g_szIndi_MtrCode, 0x00, sizeof(g_szIndi_MtrCode) );
									Mem_Set( (byte*)g_szIndi_Qty, 0x00, sizeof(g_szIndi_Qty) );
			
									Card_Move("GM_SILSA");
								}
								else
								{
									m_lLastSave = 1;
									Next_Gm();
								}
							}
							else
							{
								g_lDataflag = 1;
							}
							
							m_lSmsStsFlag = 0;
							ret = 1;
							goto Finally2;
						}
						else if( m_lSmsStsFlag == 2 )
						{
							//위의 1, 3번의 경우.
							Mem_Set((byte*) szTmp, 0x00, sizeof( szTmp) );
							Mem_Set((byte*) szCol, 0x00, sizeof( szCol) );
							g_Str_DateType(szCol, stGm.PLAN_DTM);
							SPRINT(szTmp, "문자발송 예약시간을 확인해주세요.\n[예약일자:%s]", szCol,0,0);
							MessageBoxEx (CONFIRM_OK, szTmp);
							m_lSmsStsFlag = 0;
							ret = 0;
							goto Finally2;
						}
					}
				}
			}
			else if( Str_Cmp(stGm.GMTR_SEND_STS, "10") == 0 || Str_Cmp(stGm.GMTR_SEND_STS, "50") == 0 )
			{	
				//m_lSmsStsFlag = 1 문자대상 -> 업무 정상 등록 시 상태 , = 2 검침취소(삭제) 시 상태
				//m_lSmsDelFlag = 0 default , = 1 문자대상 -> 업무 정상 등록 시 삭제 , = 2 검침취소(삭제) 시 삭제
				if( m_lSmsStsFlag == 1 )
				{
					m_lSmsDelFlag = 1;
				}
				else if( m_lSmsStsFlag == 2 )
				{
					m_lSmsDelFlag = 2;
				}
				
				m_lSmsStsFlag = 0;
				Snd_Delete();
				ret = 1;
				goto Finally2;
			}
			else
			{
				if( m_lSmsStsFlag == 1 )
				{
					m_lSmsStsFlag = 0;
					
					if( Save_Gm() > 0 )
					{
						if( 10 == m_lUserData )
						{
							Str_Cpy(g_szMtr_Code, stGm.MTR_WORK_CODE);
						}
						
						g_nBackFlag++;
						
						if( g_nBackFlag > 99)
						{
							g_Db_Backup();
							g_nBackFlag = 0;
						}
	
						//stGm.INSP_YN -> Y : 실사대상 , stGm.INSP_YN -> N : 실사대상 아님.
						if( Str_Cmp(stGm.INSP_YN, "Y") == 0 && 
						(Str_Cmp(stGm.MTR_WORK_CODE, "1") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "3") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "A") == 0 ||
						 Str_Cmp(stGm.MTR_WORK_CODE, "B") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "C") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "D") == 0 ||
						 Str_Cmp(stGm.MTR_WORK_CODE, "5") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "6") == 0 || Str_Cmp(stGm.MTR_WORK_CODE, "7") == 0 ))
						{
							g_nActIndex++;
							g_lindex = g_SREACHFILE_GetSeq(SREACH_FILE, g_nActIndex);
					
							if( g_nActIndex > m_ltotcnt || g_lindex < 0 )
							{
								if( g_SREACHFILE_GetSeq(SREACH_FILE, g_nActIndex) < g_nActIndex )
								{
									g_nActIndex = g_nActIndex-1;
								}
								g_lindex = g_SREACHFILE_GetSeq(SREACH_FILE, g_nActIndex);
							}
							
							g_lDataflag = 0;
							Str_Cpy(stGm.SUBMONITOR_FLAG, "0");
							Mem_Set( (byte*)g_szIndi_MtrCode, 0x00, sizeof(g_szIndi_MtrCode) );
							Mem_Set( (byte*)g_szIndi_Qty, 0x00, sizeof(g_szIndi_Qty) );
	
							Card_Move("GM_SILSA");
						}
						else
						{
							m_lLastSave = 1;
							Next_Gm();
						}
					}
					else
					{
						g_lDataflag = 1;
					}
					
					Set_Index();
					ret = 1;
					goto Finally2;
				}
				else if( m_lSmsStsFlag == 2 )
				{
					m_lSmsStsFlag = 0;

					if( Str_Cmp(stGm.GMTR_SEND_STS, "") == 0 || Str_Cmp(stGm.GMTR_SEND_STS, "null") == 0 || Str_Cmp(stGm.GMTR_SEND_STS, "NULL") == 0 )
					{	
						Del_Gm();
						SetData();
						SetStyle();
						REDRAW();
						
						ret = 1;
						goto Finally2;
					}
					else
					{
						//위의 상태값을 제외한 상태 값인 경우 취소 불가.
						MessageBoxEx (CONFIRM_OK, "취소 할 수 없는 문자검침 대상입니다.");
						ret = -1;

						//삭제된 정보 문자검침 대상 상태 수신
						Rcv_SmsSts();
						//Rcv_Many();
					}
				}
			}
		}
		else if( m_lSmsStsFlag == 3 )
		{
			//m_lSmsStsFlag = 3 문자대상 등록시 상태
			m_lSmsStsFlag = 0;
			//m_lSmsAgreeFlag = 0;

			if( nservicenum == 25008 )
			{
				if( Str_Cmp(stGm.GMTR_SEND_STS, "90") == 0 || Str_Cmp(stGm.GMTR_SEND_STS, "") == 0 || 
			        Str_Cmp(stGm.GMTR_SEND_STS, "null") == 0 || Str_Cmp(stGm.GMTR_SEND_STS, "NULL") == 0 )
				{
					Snd_Sms_New();
					
					ret = 1;
					goto Finally2;
				}
				else
				{
					if( Str_Cmp(stGm.SEND_TYPE, "30") == 0 )
					{
						Snd_Sms_New();
						ret = 1;
						goto Finally2;
					}
					else
					{
						MessageBoxEx (CONFIRM_OK, "이미 문자검침대상입니다.");
						ret = 1;
						goto Finally2;
					}
				}
			}
		}
		
Finally2 :
		if(g_pjcomm != NULL)
		{
			JSON_Finalize(g_pjcomm);
			g_pjcomm = NULL;
		}

		g_Close_SubDlg();
		EvtDraw();
		
		return ret;
	}
	
	/*=======================================================================================
	함수명 : safe_chkdata
	기  능 : 검침 -> 점검으로 갈때 CHK
	Param  : 
	Return :
	========================================================================================*/
	long safe_chkdata(void)
	{
		char sztmp[200];
		char szSql[1000];
		char szbuf[10];
		
		Read_RcvLog();
		
		if( Str_Len(m_szRcvDay) != 8 )
		{
			return -1;
		}
		
		if( Str_AtoI(m_szRcvDay) != Time_GetDate() )
		{
			//점검송신카운트 재수신 메세지 처리...>
			Mem_Set( (byte*)szSql, 0x00, sizeof(szSql) );
			Mem_Set( (byte*)sztmp, 0x00, sizeof(sztmp) );
			SPRINT( szSql ,"SELECT SUM(C.CNT) AS CNT \
			                  FROM ( SELECT COUNT(SEND_YN) AS CNT FROM NORMAL_INFO  WHERE SEND_YN = 'S' \
									  UNION ALL SELECT COUNT(SEND_YN) AS CNT  FROM NORMAL_NOGOOD  WHERE SEND_YN = 'S' \
									  UNION ALL SELECT COUNT(SEND_YN) AS CNT  FROM NORMAL_NOGOOD_CHA  WHERE SEND_YN = 'S' \
									  UNION ALL SELECT COUNT(SEND_YN) AS CNT FROM NORMAL_NOGOOD_DETAL  WHERE SEND_YN = 'S' \
									  UNION ALL SELECT COUNT(SEND_YN) AS CNT FROM NORMAL_VISIT  WHERE SEND_YN = 'S' \
									  UNION ALL SELECT COUNT(SEND_YN) AS CNT FROM NORMAL_BUR  WHERE SEND_YN = 'S' \
									  UNION ALL SELECT COUNT(SEND_YN) AS CNT FROM NORMAL_MTR  WHERE SEND_YN = 'S' and  length(UPD_EMPID) > 0 \
									  UNION ALL SELECT COUNT(SEND_YN) AS CNT FROM NORMAL_DATA  WHERE SEND_YN = 'S' \
									  UNION ALL SELECT COUNT(SEND_YN) AS CNT FROM NORMAL_STANDPIPE_CHK_RSLT WHERE SEND_YN = 'S' ) C "
            , 0, 0, 0 );

			g_Sql_RetStr(szSql, 4, sztmp );
			
			if(Str_AtoI(sztmp) > 0) 
			{
				MessageBoxEx(CONFIRM_OK, "점검자료가 금일자료가 아닙니다.\n미전송 데이터 전송후\n자료를 수신하세요!");
				return 0;
			}
			else
			{
				MessageBoxEx(CONFIRM_OK, "점검자료가 금일자료가 아닙니다.\n점검자료 수신을 시작 합니다.");

				g_Sql_DirectExecute("DELETE FROM NORMAL_ADDR");
				g_Sql_DirectExecute("DELETE FROM NORMAL_BUR");
				g_Sql_DirectExecute("DELETE FROM NORMAL_DATA");
				g_Sql_DirectExecute("DELETE FROM NORMAL_GROUP");
				g_Sql_DirectExecute("DELETE FROM NORMAL_INFO");
				g_Sql_DirectExecute("DELETE FROM NORMAL_MTR");
				g_Sql_DirectExecute("DELETE FROM NORMAL_NOGOOD");
				g_Sql_DirectExecute("DELETE FROM NORMAL_NOGOOD_CHA");
				g_Sql_DirectExecute("DELETE FROM NORMAL_NOGOOD_DETAL");
				g_Sql_DirectExecute("DELETE FROM NORMAL_PIPE_CHK_DATA");
				g_Sql_DirectExecute("DELETE FROM NORMAL_PREV_NO");
				g_Sql_DirectExecute("DELETE FROM NORMAL_VISIT");
				g_Sql_DirectExecute("DELETE FROM CUST_PATT_COLL_INFO");	
				g_Sql_DirectExecute("DELETE FROM NORMAL_STANDPIPE_CHK_RSLT");	

				RCV311324();
				ON_DRAW();
				return 1;
			}
		}
		
		return -1;
	}

	/*=======================================================================================
	함수명 : Read_RcvLog
	기  능 : 검침 -> 점검으로 갈때 저장되어있는 점검일자 가져옴
	Param  : 
	Return :
	========================================================================================*/
	long Read_RcvLog(void)
	{
		long i;
		long ret= 0;
		handle hdb = NULL;
		handle hstmt = NULL;
		SQLITE sql = NewSqLite();

		Mem_Set( (byte*) m_szchktype, 0x00, sizeof( m_szchktype) );
		Mem_Set( (byte*) m_szobjym, 0x00, sizeof( m_szobjym) );
		Mem_Set( (byte*) m_szchkyear, 0x00, sizeof( m_szchkyear) );
		Mem_Set( (byte*) m_szchkorder, 0x00, sizeof( m_szchkorder) );
		Mem_Set( (byte*) m_szzone_manage_num, 0x00, sizeof( m_szzone_manage_num) );
		Mem_Set( (byte*) m_szRcvDay, 0x00, sizeof( m_szRcvDay) );

		hdb = sql->Open(sql);
		
		if( hdb == NULL )
		{
			goto Finally;
		}
		
		hstmt = sql->CreateStatement(sql,"SELECT PARAM1, PARAM2, PARAM3, PARAM4, PARAM6, PARAM7 FROM RCV_LOG WHERE GUBUN = '2' ");
		
		if( hstmt == NULL )
		{
			PRINT("::SQL_CreateStatement fail [%s]", sql->GetLastError(sql), 0, 0);
			goto Finally;
		}

		if(sql->Execute(sql) == FALSE)
		{
			PRINT("::SQL_Execute fail [%s]", sql->GetLastError(sql), 0, 0);
			goto Finally;
		}
		
		if(sql->Next(sql) == TRUE)
		{	
			i = 0;
			sql->GetValue( sql, i++, 'U', (long*) m_szchkyear			, 4 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) m_szchkorder			, 2 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) m_szobjym				, 6 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) m_szchktype			, 2 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) m_szzone_manage_num	, 5 + 1, DECRYPT );
			sql->GetValue( sql, i++, 'U', (long*) m_szRcvDay	        , 8 + 1, DECRYPT );
			
			ret++;
		}
		
Finally:
		DelSqLite(sql);
		return ret;
	}
	
	/*=======================================================================================
	함수명 : Rcv_self_select / FR25011
	기  능 : 자가검침 지침 SELECT
	Param  : 
	Return :
	========================================================================================*/
	long Rcv_self_select(void)
	{
		char sztmp[256];
		char szUrl[256];
		char szReqym[10];
		char szDeadlineFlag[10];
		char* sndbuf;
		long ret;
		
		if( Str_Cmp( stGm.SEND_YN, "" ) != 0 && Str_Cmp( stGm.SEND_YN, "N" ) != 0 )
		{
			return 1;
		}
		
		Mem_Set( (byte*) sztmp, 0x00, sizeof( sztmp) );
		Mem_Set( (byte*) szReqym, 0x00, sizeof( szReqym) );
		SPRINT( sztmp, "SELECT PARAM1 FROM RCV_LOG WHERE GUBUN = '10' ", 0, 0, 0 );
		g_Sql_RetStr(sztmp, 10, szReqym);
		
		Mem_Set( (byte*) sztmp, 0x00, sizeof( sztmp) );
		Mem_Set((byte*)szDeadlineFlag, 0x00, sizeof(szDeadlineFlag));	
		SPRINT( sztmp, "SELECT PARAM2 FROM RCV_LOG WHERE GUBUN = '10' ", 0, 0, 0 );
		g_Sql_RetStr(sztmp, 10, szDeadlineFlag);
	
		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}		
		
		g_pjcomm = g_CreateJsonHead(g_pjcomm, szUrl, 25011, FALSE);
		
		JSON_SetValue( g_pjcomm, 'C', "req_ym",              szReqym               );
		JSON_SetValue( g_pjcomm, 'C', "deadline_flag",       szDeadlineFlag        );
		JSON_SetValue( g_pjcomm, 'C', "mtr_num",             stGm.MTR_NUM     );
		
		sndbuf = JSON_toString(g_pjcomm);
		
		g_Save_JsonFile(sndbuf);
		
		Mem_Set((byte*)sztmp, 0x00, sizeof(sztmp));	
		GET_FILENM(sztmp, SQLITE_DB);
		
		callBackfunc = TR25011;
		ret = HTTP_DownloadData(szUrl, "FR25011_IN",  "FR25011" , sndbuf, sztmp );
		return 1 ;
	}

	/*=======================================================================================
	함수명 : TR25011
	기  능 : FR25011 CALLBACK
	Param  : 
	Return :
	========================================================================================*/
	long TR25011(void)
	{
		if( g_Chk_Json(25011) >= 0)
		{
			SelfSelect();		
			ON_DRAW();
			return 1;	
		}
		else
		{
			g_Sock_Close();
			ON_DRAW();
			return 1;
		}
	}
	
	/*=======================================================================================
	함수명 : SelfSelect
	기  능 : FR25011 DATA SETTING
	Param  : 
	Return :
	========================================================================================*/
	long SelfSelect(void)
	{
		char szJsonpath[500]; 
		char szMsg[500];
		char szTmp[100];
		long nCnt = 0;
		long fd, i;
		long chkmsg = 0;
		long chkcode = 0;
		long fsize = 0;
		char *pStr;
		char *szcode;
		char *szmessage;
		char *szitem;
		long *szSelfIndiVc;
		char szType[2] = {0,0};
		long ret = 11;
		handle hitem = NULL;
		handle hcnt = NULL;
		
		Mem_Set((byte*) szJsonpath, 0x00, sizeof( szJsonpath) );
		SPRINT(szJsonpath, "%sFR%d_Res.JSON",  SYSTEM_COMM, 25011, 0 );
		
		if(FFS_Exist(szJsonpath) != TRUE )
		{
			Mem_Set((byte*) szJsonpath, 0x00, sizeof( szJsonpath) );
			SPRINT(szJsonpath, "%sFR%d.JSON",  SYSTEM_COMM, 25011, 0 );
		}
		
		fsize = FFS_GetSize(szJsonpath);
		if(fsize <= 15)
		{
			ret = -1;
			goto Finally;
		}
		
		pStr = Mem_Alloc(fsize);
		
		fd = FFS_Open(szJsonpath, FS_READ_MODE, FS_NORMAL_FLAG);
		
		if(fd == -1)
		{
			ret = -1;
			goto Finally;
		}

		FFS_Read(fd, (byte*)pStr, fsize);
		
		for(i = 0 ; i < fsize-9 ; i++ )
		{
			if( Mem_Cmp((byte*)pStr+i,(byte*) "\"code\"", 6) == 0  )
			{
				chkcode++;
			}
			if( Mem_Cmp((byte*)pStr+i,(byte*) "\"message\"", 9) == 0  )
			{
				chkmsg++;
			}
			if(chkmsg > 0 &&  chkcode > 0)
				break;
		}

		FFS_Close(fd);
		
		Mem_Free((byte*)pStr);
		if(chkmsg == 0 || chkcode == 0)
		{
			ret = -1;
			goto Finally;
		}
		
		if(g_pjcomm != NULL)
		{
			JSON_Finalize(g_pjcomm);
			g_pjcomm = NULL;
		}
		
		g_pjcomm = JSON_Create( JSON_Object );
		
		if(g_pjcomm == NULL)
		{
			ret = -1;
			goto Finally;
		}

		if( JSON_LoadFile(g_pjcomm, szJsonpath) > 0)
		{
			szcode    = JSON_GetValue (g_pjcomm, "code",    szType);
			szmessage = JSON_GetValue (g_pjcomm, "message", szType);

			if( Str_Cmp(szcode, "0000") != 0)
			{
				Mem_Set((byte*) szJsonpath, 0x00, sizeof( szJsonpath) );
				if(Str_Len(szmessage) < 500 )
					SQL_ConvMbStr( szMsg, szmessage);
				
				SPRINT(szJsonpath, "[%s] %s", szcode, szMsg, 0 );
			
				MessageBoxEx (WARNING_OK, szJsonpath);
				ON_DRAW();
				ret = -1;
			}
			else
			{
				ret = 0;
				szitem =JSON_GetValue(g_pjcomm, "item", szType);
				if(szitem != NULL)
				{
					if( Str_Len(szitem) > 0 )
					{
						hitem = JSON_Create( JSON_Array );
						if( hitem != NULL)
						{
							JSON_toJson(hitem, szitem ) ;
							ret = JSON_GetArrayCount( hitem );
							
							if( ret > 0 )
							{
								szSelfIndiVc = (long*)JSON_GetArrayItem ( hitem, 0, "indi_compens_this_mm_vc", szType);
								nCnt = *szSelfIndiVc;
								Mem_Set((byte*)szTmp, 0x00, sizeof(szTmp));
								Str_ItoA(nCnt, szTmp, 10);
								
								// VC
								EditCtrl_SetStr( Get_hDlgCtrlByID(EDT_VC), szTmp );
								
								//사용량
								Cal_UseQty( EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_VC)) );
								
								if( m_lUserData == 10 )
								{	
									EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_USEQTY), m_szIndiQty);
								}
								else
								{
									EditCtrl_SetStr(Get_hDlgCtrlByID(TXT_DATA13), m_szIndiQty);
								}
								
								//DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), FALSE );
								//DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_SAVE), TRUE );
								
								//DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), FALSE );
								//DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(BID_DELETE), TRUE );
								
								//DlgCtrl_SetEnable(this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), FALSE );
								//DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(EDT_VC), TRUE );
								
								//DlgCtrl_SetEnable( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), FALSE);
								//DlgCtrl_SetGray( this->m_hDlg, Get_iDlgCtrlByID(CMB_RESULT+1), TRUE );
								
								EditCtrl_SetStr( Get_hDlgCtrlByID(CMB_RESULT), "자가검침" );
								
								Mem_Set((byte*) m_szIndiVc, 0x00, sizeof( m_szIndiVc) );
								Str_Cpy( m_szIndiVc, szTmp );

								Dialog_SetActiveCtrl(this->m_hDlg, Get_iDlgCtrlByID(BID_NEXTPG) );
								m_lEditCtrlIndex = Dialog_GetActiveCtrlIndex(this->m_hDlg);
							}
							
							JSON_Finalize(hitem);
							hitem = NULL;
						}
					}
				}
			}
		}
		else
		{
			ret = 1;
		}
		
Finally:		
		if(g_pjcomm != NULL)
		{
			JSON_Finalize(g_pjcomm);
			g_pjcomm = NULL;
		}

		g_Close_SubDlg();
		EvtDraw();
		
		return ret;
	}
	
	/*=======================================================================================
	함수명 : fn_Compens_Sign
	기  능 : 보정기 삭제 서명 데이터 SETTING
	Param  : 
	Return :
	========================================================================================*/
	void fn_Compens_Sign(void)
	{
		char szSql[300];
		char* pRst = NULL;
		char szTmp[300];
		char szYmd[20];
		char szTime[20];
		long idx;
		long lsign, lSign_Len;
		long cnt = 0;	
		
		handle hdb = NULL;
		handle hstmt = NULL;
		SQLITE sql = NewSqLite();
		
		/**************************/
		/* SIGN                   */
		/**************************/
		Mem_Set((byte*)g_SignBuf, 0xff, sizeof(g_SignBuf));
		lsign = GetSignImgTitleWithOpt( SIGN_WIDTH, SIGN_HEIGHT, (char*)g_SignBuf, "성명", SIGN_OPT_NONE );
		
		if( lsign == SIGN_RET_CANCEL || lsign == SIGN_RET_FAIL )
		{
			return;
		}
		else if( lsign == SIGN_RET_SUCCESS )
		{
			g_png_getbmp(SIGN_WIDTH, SIGN_HEIGHT, g_SignBuf );
			
			if(g_pjcomm != NULL )
			{
				BASE64_Finalize(g_pjcomm);
				g_pjcomm = NULL;
			}
			
			g_pjcomm = BASE64_Create();
			lSign_Len = BASE64_Encode(g_pjcomm, g_SignBuf, BMP_SIZE );
			pRst = BASE64_GetResult(g_pjcomm);				
		}
		
		/**************************/
		/* Data Setting           */
		/**************************/
		Mem_Set( (byte*)szSql, 0x00, sizeof(szSql) );
		SPRINT(szSql, "SELECT COUNT(1) FROM GUM_COMPENS_REMOVE_REQ WHERE REQ_YM = %s AND DEADLINE_FLAG = %s AND MTR_NUM = %s", stGm.REQ_YM, stGm.DEADLINE_FLAG, stGm.MTR_NUM);
		g_Sql_RetInt( szSql , &cnt );

		hdb = sql->Open(sql);
		
		if( hdb == NULL )
		{
			goto Finally;
		}
		
		// INSERT
		if( cnt <= 0 )
		{	
			hstmt = sql->CreateStatement(sql, "INSERT INTO GUM_COMPENS_REMOVE_REQ \
										       ( REQ_YM, DEADLINE_FLAG, MTR_NUM, USE_CONT_NUM, SIGN ) \
										       VALUES \
										       ( ?, ?, ?, ?, ? )"
			);
			
			if( hstmt == NULL )
			{
				PRINT("::SQL_CreateStatement fail [%s]", sql->GetLastError(sql), 0, 0);
				goto Finally;
			}
			
			idx = 0;
			
			sql->Bind(sql, idx++, 'U', (long *)stGm.REQ_YM				,6	+1, DECRYPT);
			sql->Bind(sql, idx++, 'U', (long *)stGm.DEADLINE_FLAG		,2  +1, DECRYPT);
			sql->Bind(sql, idx++, 'U', (long *)stGm.MTR_NUM				,9  +1, DECRYPT);
			sql->Bind(sql, idx++, 'U', (long *)stGm.USE_CONT_NUM		,10 +1, DECRYPT);
			sql->Bind(sql, idx++, 'U', (long *)pRst			        	,Str_Len(pRst), DECRYPT);
		}
		// UPDATE
		else
		{
			hstmt = sql->CreateStatement(sql, "UPDATE GUM_COMPENS_REMOVE_REQ \
			                                      SET SIGN = ? \
			                                    WHERE REQ_YM = ? AND DEADLINE_FLAG = ? AND MTR_NUM = ? "
			);
			
			if( hstmt == NULL )
			{
				PRINT("::SQL_CreateStatement fail [%s]", sql->GetLastError(sql), 0, 0);
				goto Finally;
			}
			
			idx = 0;
			
			sql->Bind(sql, idx++, 'U', (long *)pRst			        	,Str_Len(pRst), DECRYPT);
			sql->Bind(sql, idx++, 'U', (long *)stGm.REQ_YM				,6	+1, DECRYPT);
			sql->Bind(sql, idx++, 'U', (long *)stGm.DEADLINE_FLAG		,2  +1, DECRYPT);
			sql->Bind(sql, idx++, 'U', (long *)stGm.MTR_NUM				,9  +1, DECRYPT);
		}
		
		if(sql->Execute(sql) == FALSE)
		{
			PRINT("::SQL_Execute fail [%s]", sql->GetLastError(sql), 0, 0);
			goto Finally;
		}
			
Finally:

		if(g_pjcomm != NULL )
		{
			BASE64_Finalize(g_pjcomm);
			g_pjcomm = NULL;
		}			
		
		DelSqLite(sql);
		
		cnt = 0;
		
		Mem_Set( (byte*)szSql, 0x00, sizeof(szSql) );
		SPRINT(szSql, "SELECT LENGTH( SIGN ) FROM GUM_COMPENS_REMOVE_REQ WHERE REQ_YM = '%s' AND DEADLINE_FLAG = '%s' AND MTR_NUM = '%s'", stGm.REQ_YM, stGm.DEADLINE_FLAG, stGm.MTR_NUM);
		g_Sql_RetInt( szSql, &cnt );
		
		if( cnt < 100)
		{
			ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_COMPENS_SIGN), BTNCTRLBKCOLOR);
			ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_COMPENS_SIGN), BTNMENUFRCOLOR);
		}
		else
		{
			ButCtrl_SetBkColorEx(Get_hDlgCtrlByID(BID_COMPENS_SIGN), RED);
			ButCtrl_SetForeColorEx(Get_hDlgCtrlByID(BID_COMPENS_SIGN), BTNMENUFRCOLOR);
		}
		
		ON_DRAW();
	}
	
	/*=======================================================================================
	함수명 : fn_Compens_Save
	기  능 : 보정기 삭제 데이터 SETTING
	Param  : 
	Return :
	========================================================================================*/
	bool fn_Compens_Save(void)
	{
		char szSql[300];
		char szTmp[300];
		char szYmd[20];
		char szTime[20];
		char szConfNm[30];
		long idx = 0;
		long lLen = 0;
		bool ret = TRUE;
		handle hdb = NULL;
		handle hstmt = NULL;
		SQLITE sql = NewSqLite();
		
		/**************************/
		/* Validation             */
		/**************************/
		// 1. 확인자
		Mem_Set( (byte*)szConfNm, 0x00, sizeof(szConfNm) );
		Str_Cpy( szConfNm, EditCtrl_GetStr(Get_hDlgCtrlByID(EDT_COMPENS_CONF_NM)) );
		
		if( Str_Cmp(szConfNm, "") == 0 )
		{
			MessageBoxEx (CONFIRM_OK, "확인자를 입력해주세요.");
			ret = FALSE;
			goto Finally;
		}
		
		// 2. 서명
		Mem_Set( (byte*)szSql, 0x00, sizeof(szSql) );
		SPRINT(szSql, "SELECT LENGTH( SIGN ) FROM GUM_COMPENS_REMOVE_REQ WHERE REQ_YM = %s AND DEADLINE_FLAG = %s AND MTR_NUM = %s", stGm.REQ_YM, stGm.DEADLINE_FLAG, stGm.MTR_NUM);
		g_Sql_RetInt( szSql, &lLen );
		if( lLen < 100 )
		{
			MessageBoxEx (CONFIRM_OK, "서명을 입력해주세요.");
			ret = FALSE;
			goto Finally;
		}
		
		/**************************/
		/* REMOVE_REQ_YMD         */
		/**************************/
		Mem_Set( (byte*)szYmd, 0x00, sizeof(szYmd));
		Str_ItoA(Time_GetDate(), szYmd, 10);
		
		/**************************/
		/* REMOVE_REQ_TIME        */
		/**************************/
		Mem_Set( (byte*)szTime, 0x00, sizeof(szTime));
		g_Str_TimeType( szTime, Time_GetTime());
		
		/**************************/
		/* DATA_UPDATE            */
		/**************************/
		hdb = sql->Open(sql);
		
		if( hdb == NULL )
		{
			ret = 0;
			goto Finally;
		}
		
		hstmt = sql->CreateStatement(sql, "UPDATE GUM_COMPENS_REMOVE_REQ \
		                                      SET REMOVE_REQ_YMD = ?, REMOVE_REQ_TIME = ?, REMOVE_REQ_EMPID = ?, CONF_NM = ?, SEND_YN = 'S' \
		                                    WHERE REQ_YM = ? AND DEADLINE_FLAG = ? AND MTR_NUM = ? "
		);
			
		if( hstmt == NULL )
		{
			PRINT("::SQL_CreateStatement fail [%s]", sql->GetLastError(sql), 0, 0);
			MessageBoxEx (CONFIRM_OK, "저장에 실패했습니다.");
			ret = 0;
			goto Finally;
		}
			
		idx = 0;
		
		sql->Bind(sql, idx++, 'U', (long *)szYmd       		    	,8	+1, DECRYPT);
		sql->Bind(sql, idx++, 'U', (long *)szTime		        	,6  +1, DECRYPT);
		sql->Bind(sql, idx++, 'U', (long *)stUserinfo.szemployee_id	,9  +1, DECRYPT);	
		sql->Bind(sql, idx++, 'U', (long *)szConfNm					,30 +1, DECRYPT);
		
		sql->Bind(sql, idx++, 'U', (long *)stGm.REQ_YM				,6	+1, DECRYPT);
		sql->Bind(sql, idx++, 'U', (long *)stGm.DEADLINE_FLAG		,2  +1, DECRYPT);
		sql->Bind(sql, idx++, 'U', (long *)stGm.MTR_NUM				,9  +1, DECRYPT);
		
		if(sql->Execute(sql) == FALSE)
		{
			PRINT("::SQL_Execute fail [%s]", sql->GetLastError(sql), 0, 0);
			MessageBoxEx (CONFIRM_OK, "저장에 실패했습니다.");
			ret = 0;
			goto Finally;
		}	
		
Finally:
		DelSqLite(sql);	
		
		return ret;
	}
	
	/*=======================================================================================
	함수명 : Shoto_Photo_Compens
	기  능 : 사진촬영
	Param  : 
	Return : 
	========================================================================================*/
	void Shoto_Photo_Compens( void )
	{
		char *pCamera;
		char sztmp[100];
		char sztmp2[100];
		char szDate[100];
		long nRet;
		
		handle h = NULL;
		handle hdata = NULL;
		
		// C48(코드) | M(계량기번호) | R(청구년월) | D(납기)| T( 타입 : VC = 1, VA = 2, VM = 3 ) | D(생성날짜(SYSDATE : YYYYMMDDHHMMSS))
		Mem_Set( (byte*)m_szfilenm, 0x00, sizeof(m_szfilenm) );
		Str_Cpy( m_szfilenm, stGm.MTR_NUM );
		Str_Cat( m_szfilenm, "_" );
		Str_Cat( m_szfilenm, stGm.REQ_YM );
		Str_Cat( m_szfilenm, "_" );
		Str_Cat( m_szfilenm, stGm.DEADLINE_FLAG );
		Str_Cat( m_szfilenm, "_" );
		Str_Cat( m_szfilenm, m_szPhoto_CompensType );
		Str_Cat( m_szfilenm, ".jjp" );
		
		Mem_Set( (byte*)g_szphoto, 0x00, sizeof(g_szphoto) );
		SPRINT( g_szphoto, "%s/%s", PHOTO_GMCOMPENS, m_szfilenm, 0 );
		
		ShootPhoto( 1, 0, m_szfilenm );
		
		return;
	}
	
	/*=======================================================================================
	함수명 : FR26002
	기  능 : 사진 전송
	Param  : 
	Return : 
	========================================================================================*/
	void FR26002( void )
	{
		char szUrl[200];
		char szbuf[200];
		char sztmp[200];
		char szSql[200];
		char szScrPht[200];
		char* sndbuf;
		char* szfile = NULL;
		
		long filesize = 0;
		long ret = 0;
		long i, idx, fd;
		
		byte* signimg = NULL;
		
		handle file;
			
		// SERVER CONNECTION
		Mem_Set( (byte*)szUrl, 0x00, sizeof(szUrl) );
		Mem_Set( (byte*)szbuf, 0x00, sizeof(szbuf) );
		
		if( g_pjcomm != NULL)
		{
			JSON_Finalize( g_pjcomm );
			g_pjcomm = NULL;
		}
		
		// Json Setting
		g_pjcomm = g_CreateJsonHead( g_pjcomm, szUrl, 26002, FALSE );
		
		JSON_SetValue( g_pjcomm, 'C', "center_cd"       , stUserinfo.szcenter_cd 	);
		JSON_SetValue( g_pjcomm, 'C', "use_cont_num"	, stGm.USE_CONT_NUM 		);
		JSON_SetValue( g_pjcomm, 'C', "inst_place_num"  , stGm.INST_PLACE_NUM		);
		JSON_SetValue( g_pjcomm, 'C', "mtr_num"   		, stGm.MTR_NUM 				);
		JSON_SetValue( g_pjcomm, 'C', "req_ym"   		, stGm.REQ_YM 				);
		JSON_SetValue( g_pjcomm, 'C', "deadline_flag"   , stGm.DEADLINE_FLAG 		);
		JSON_SetValue( g_pjcomm, 'C', "type"   			, m_szPhoto_CompensType  	);
		JSON_SetValue( g_pjcomm, 'C', "mtr_id_num"      , stGm.MTR_ID_NUM 			);
		
		Mem_Set( (byte*) sztmp, 0x00, sizeof( sztmp) );
		Mem_Set( (byte*) szSql, 0x00, sizeof( szSql) );
		SPRINT( szSql, "SELECT PARAM6 FROM RCV_LOG WHERE GUBUN = '10' ", 0, 0, 0 );
		g_Sql_RetStr(szSql, 5, sztmp);
		
		JSON_SetValue( g_pjcomm, 'C', "zone_manage_num" , sztmp );
		
		// FILE NAME
		Mem_Set( (byte*)sztmp, 0x00, sizeof(sztmp) );
		Str_Cpy( sztmp, stGm.MTR_NUM );
		Str_Cat( sztmp, "_" );
		Str_Cat( sztmp, stGm.REQ_YM );
		Str_Cat( sztmp, "_" );
		Str_Cat( sztmp, stGm.DEADLINE_FLAG );
		Str_Cat( sztmp, "_" );
		Str_Cat( sztmp, m_szPhoto_CompensType );
		Str_Cat( sztmp, ".jjp" );
		
		Mem_Set( (byte*)szScrPht, 0x00, sizeof(szScrPht) );
		SPRINT( szScrPht, "%s/%s", PHOTO_GMCOMPENS, sztmp, 0 );
		filesize = FFS_GetSize( szScrPht );
		
		if( filesize > 0 )
		{
			signimg = Mem_Alloc( filesize );
			
			fd = FFS_Open( szScrPht, FS_READ_MODE, FS_NORMAL_FLAG );
			FFS_Read ( fd, (byte*)signimg, filesize );
			FFS_Close( fd );
	
			file = BASE64_Create();
			BASE64_Encode( file, signimg, filesize );
			szfile = BASE64_GetResult( file );	
			JSON_SetValue( g_pjcomm, 'C', "photo_compens", szfile );
			free( (byte*)signimg );
			BASE64_Finalize( file );
			file = NULL;
		}
		
		sndbuf = JSON_toString( g_pjcomm );
		
		g_SeverConnection();
		
		Mem_Set( (byte*)szbuf, 0x00, sizeof(szbuf) );	
		GET_FILENM( szbuf, SQLITE_DB );
		
		callBackfunc = TR26002;
		ret = HTTP_DownloadData( szUrl, "FR26002_IN", "FR26002", sndbuf, szbuf );
		
		return;
	}
	
	/*=======================================================================================
	함수명 : TR26002
	기  능 : FR26002 Callback
	Param  : 
	Return : 
	========================================================================================*/
	long TR26002( void )
	{
		char szTmp[300];
		
		g_Sock_Close();
		CloseMessageBox();
		
		if( g_Chk_Json(26002) >= 0 )
		{
			VmSleep( 100 );
			
			Mem_Set( (byte*)szTmp, 0x00, sizeof(szTmp) );
			
			if( Str_Cmp(m_szPhoto_CompensType, "1" ) == 0 )
			{	
				SPRINT( szTmp, "UPDATE REGUMDATA SET PHOTO_COMPENS_VC_YN = 'Y' WHERE ROWID = '%s'", stGm.ROWID, 0, 0 );
				g_Sql_DirectExecute( szTmp ); 
				
				Mem_Set( (byte*)stGm.PHOTO_COMPENS_VC_YN, 0x00, sizeof(stGm.PHOTO_COMPENS_VC_YN) );
				Str_Cpy( stGm.PHOTO_COMPENS_VC_YN, "Y" );
			}
			else if( Str_Cmp(m_szPhoto_CompensType, "2" ) == 0  )
			{
				SPRINT( szTmp, "UPDATE REGUMDATA SET PHOTO_COMPENS_VA_YN = 'Y' WHERE ROWID = '%s'", stGm.ROWID, 0, 0 );
				g_Sql_DirectExecute( szTmp ); 
			
				Mem_Set( (byte*)stGm.PHOTO_COMPENS_VA_YN, 0x00, sizeof(stGm.PHOTO_COMPENS_VA_YN) );
				Str_Cpy( stGm.PHOTO_COMPENS_VA_YN, "Y" );
			}
			else if( Str_Cmp(m_szPhoto_CompensType, "3" ) == 0  )
			{
				SPRINT( szTmp, "UPDATE REGUMDATA SET PHOTO_COMPENS_VM_YN = 'Y' WHERE ROWID = '%s'", stGm.ROWID, 0, 0 );
				g_Sql_DirectExecute( szTmp ); 
			
				Mem_Set( (byte*)stGm.PHOTO_COMPENS_VM_YN, 0x00, sizeof(stGm.PHOTO_COMPENS_VM_YN) );
				Str_Cpy( stGm.PHOTO_COMPENS_VM_YN, "Y" );
			}
			
			FFS_Delete( g_szphoto );
			
			VmSleep( 100 );
			
			NUM_DRAW();
			
			return 1;
		}
		else
		{	
			NUM_DRAW();
			return -1;
		}
	}
}

