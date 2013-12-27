var NDS_PATH="/html/nds";
function PortalInitObject(){}
PortalInitObject.prototype={
};
var gMessageHolder={
	LOADING:"\u670d\u52a1\u5668\u5904\u7406\u4e2d",
	CATEGORY_GUIDE:"\u5206\u7c7b\u5bfc\u822a",
	MAINTAIN_BY_SYS: "\u7cfb\u7edf\u7ef4\u62a4",
	TIME_OUT:"\u64cd\u4f5c\u8d85\u65f6",
	NO_DATA_TO_PROCESS:"\u6ca1\u6709\u9700\u8981\u5904\u7406\u7684\u6570\u636e",
	DO_YOU_CONFIRM_DELETE:"\u4f60\u786e\u8ba4\u8981\u6267\u884c\u5220\u9664\uff1f",
	DO_YOU_CONFIRM_SUBMIT:"\u4f60\u786e\u8ba4\u8981\u6267\u884c\u63d0\u4ea4\u52a8\u4f5c\u5417?",
	DO_YOU_CONFIRM_GROUPSUBMIT:"\u5f53\u524d\u7c7b\u578b\u5bf9\u8c61\u7684\u591a\u884c\u540c\u65f6\u63d0\u4ea4\u5c06\u4ea7\u751f\u6570\u636e\u201c\u5408\u5e76\u201d\u7684\u7279\u6b8a\u529f\u80fd\u3002\\n\\n\u60a8\u786e\u8ba4\u8981\u6267\u884c\u6b64\u7279\u6b8a\u529f\u80fd?\\n\\n\uff08\u9009\u62e9\u201c\u53d6\u6d88\u201d\u5982\u679c\u60a8\u5c1a\u4e0d\u4e86\u89e3\u6240\u8c13\u201c\u5408\u5e76\u201d\u7684\u610f\u4e49\uff0c\u5e76\u67e5\u770b\u6709\u5173\u5e2e\u52a9\u4ee5\u660e\u786e\uff09",
	NO_PERMISSION: "\u6ca1\u6709\u6743\u9650",
	EXCEPTION: "\u5f02\u5e38",
	PLEASE_SWITCH_TO_MODIFY_VIEW:"\u8bf7\u5148\u5207\u6362\u5230\u4fee\u6539\u754c\u9762",
	MODIFY_VIEW:"\u5207\u6362\u5230\u4fee\u6539\u754c\u9762",
	READ_ONLY_VIEW:"\u5207\u6362\u5230\u53ea\u8bfb\u754c\u9762",
	PLEASE_CHECK_SELECTED_LINES_FOR_SUBMIT:"\u8bf7\u5728\u8981\u63d0\u4ea4\u7684\u884c\u9996\u6253\u52fe\u786e\u8ba4\uff01",
	PLEASE_SELECT_LINES_LESS_THAN:"\u8bf7\u9009\u62e9\u5c11\u4e8e20\u884c\u7684\u6570\u636e\uff0c\u4ee5\u4fdd\u8bc1\u5ba2\u6237\u7aef\u54cd\u5e94\u901f\u5ea6\uff01",
	MORE_COMMANDS:"\u66f4\u591a",
	CMD_ADD:"\u65b0\u589e",
	CMD_MODIFY:"\u4fdd\u5b58",
	CMD_DELETE:"\u5220\u9664",
	CMD_SUBMIT:"\u63d0\u4ea4",
	CMD_REFRESH:"\u5237\u65b0",
	CMD_CXTAB:"\u7edf\u8ba1",
	CMD_LISTADD:"\u6279\u91cf\u65b0\u589e",
	CMD_IMPORT:"\u5bfc\u5165",
	CMD_LISTCOPYTO:"\u590d\u5236",
	CMD_UPDATE_SELECTION:"\u4fee\u6539\u9009\u4e2d\u884c",
	CMD_UPDATE_RESULTSET:"\u4fee\u6539\u7ed3\u679c\u96c6",
	CMD_PRINT_LIST:"\u6253\u5370",
	CMD_PRINT_SELECT:"\u5957\u6253",
	CMD_EXPORT_LIST:"\u5bfc\u51fa",
	CMD_SMS_LIST:'\u77ed\u4fe1',
	IFRAME_TITLE:'\u5bf9\u8bdd\u6846 ',
	PLS_SELECT_CXTAB:"\u8bf7\u5728\u67e5\u8be2\u680f\u9009\u62e9\u6c47\u603b\u8868\u6a21\u677f",
	NO_CXTAB:"\u5f53\u524d\u8868\u6ca1\u6709\u5b9a\u4e49\u6c47\u603b\u8868\u6a21\u677f",
	CAN_NOT_BE_NULL: "\u4e0d\u80fd\u4e3a\u7a7a",
	MUST_BE_DATE_TYPE:"\u5fc5\u987b\u662f\u65e5\u671f\u578b",
	MUST_BE_NUMBER_TYPE: "\u5fc5\u987b\u662f\u6570\u5b57\u578b",
	PLEASE_SELECT: "\u8bf7\u9009\u62e9",
	PLEASE_SETUP_ASSIGNEE:"\u8bf7\u8bbe\u7f6e\u4ee3\u529e\u4eba",
	SEARCH:"\u67e5\u627e",
	CONTAINS:"\u5305\u542b",
	NOTCONTAINS:"\u4e0d\u5305\u542b",
	CLEAR_CONDITION:"\u70b9\u51fb\u6e05\u9664\u5f53\u524d\u6761\u4ef6\u8bbe\u7f6e",
	PLEASE_CHECK_SELECTED_LINES:"\u8bf7\u5728\u8981\u9009\u62e9\u7684\u884c\u9996\u6253\u52fe\u786e\u8ba4\uff01",
	PLEASE_REFRESH_CXTAB_PAGE:"\u5f53\u524d\u64cd\u4f5c\u754c\u9762\u975e\u62a5\u8868\u754c\u9762\u5e03\u5c40\uff0c\u8bf7\u70b9\u51fb\u62a5\u8868\u4e2d\u5fc3\u6807\u7b7e\u9875\u91cd\u65b0\u8fdb\u5165\u62a5\u8868\u6a21\u5757\u540e\u518d\u8bd5",
	NO_DATA:"\u6ca1\u6709\u6570\u636e",
	CLOSE_DIALOG:"\u5173\u95ed",
	EXCLUDE_CHOOSED_ROWS:"\u6392\u9664\u9009\u4e2d\u884c",
	EXCLUDE_ALL:"\u6392\u9664\u5168\u90e8",
	ADD_CHOOSE_ROWS:"\u6dfb\u52a0\u9009\u4e2d\u884c",
	ADD_ALL:"\u6dfb\u52a0\u5168\u90e8",
	ALREADY_CHOOSED:"\u5df2\u88ab\u9009\u62e9",
	ALREADY_EXCLUDE:"\u5df2\u88ab\u6392\u9664",
	SET_ALREADY_CHOOSED:"\u8be5\u96c6\u5408\u5df2\u88ab\u9009\u62e9",
	SET_ALREADY_EXCLUDE:"\u8be5\u96c6\u5408\u5df2\u88ab\u6392\u9664",
	NOTICE:"\u901a\u77e5",
	PRIORITY:"\u4f18\u5148\u7ea7",
	RELEASETIME:"\u53d1\u9001\u65f6\u95f4",
	SERIALNO:"\u7f16\u53f7",
	TITLE:"\u6807\u9898",
	URGENT_MESSAGE:"\u4f60\u6709$$\u6761\u7d27\u6025\u6d88\u606f\u5fc5\u9700\u9a6c\u4e0a\u5904\u7406",
	CONFIRM_MESSAGE:"\u5171\u6709$$\u6761\u9700\u8981\u786e\u8ba4",
	ALL_NOTICES:"\u5168\u90e8\u901a\u544a",
	CMD_VOID:"\u4f5c\u5e9f",
	CMD_UNVOID:"\u53d6\u6d88\u4f5c\u5e9f",
	DO_YOU_CONFIRM_VOID:"\u4f60\u786e\u8ba4\u8981\u4f5c\u5e9f\u6240\u9009\u5355\u636e\u5417\uff1f",
	DO_YOU_CONFIRM_UNVOID:"\u4f60\u786e\u8ba4\u8981\u53d6\u6d88\u4f5c\u5e9f\u6240\u9009\u5355\u636e\u5417\uff1f"
};
