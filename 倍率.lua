function Main0()
	SN = gg.choice({
		"修改面板",
		"还原面板",
		"退出",
	}, nil, "碧蓝航线脚本")
	if SN==1 then
		HS9()
	end
	if SN==2 then
		HS666()
	end
	if SN==3 then
		exit()
	end
	FX=0
end

function HS9()
    x = gg.prompt({"伤害倍数(默认500倍)"},{"500"},{number})
    n = x[1]
	-- 清除
	gg.clearResults()
	gg.setRanges(32)
	-- 第一次搜索
	gg.searchNumber("0.0001E;1E::30", gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1, 0)
	gg.refineNumber("1", gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1, 0)
	-- 获取结果数量
	results=gg.getResultCount()
	-- 判断
	if results<8 then
		-- 清除
		gg.clearResults()
		gg.setRanges(32)
		-- 第二次搜索
		gg.searchNumber("0.0001E;1D::30", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
		gg.refineNumber("1", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
		-- 第二次搜索结果修改
		gg.getResults(8)
		gg.editAll(n, gg.TYPE_DWORD)
	else
		-- 第一次搜索结果修改
		gg.getResults(8)
		gg.editAll(n, gg.TYPE_DOUBLE)
	end
	-- 清除
	gg.clearResults()
	gg.toast("修改成功")
end

function HS666()
    x = gg.prompt({"还原倍数(默认500倍)"},{"500"},{number})
    n = x[1]
	-- 清除
	gg.clearResults()
	gg.setRanges(32)
	-- 第一次搜索
	gg.searchNumber("0.0001E;"..n.."::30", gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1, 0)
	gg.refineNumber(n, gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1, 0)
	-- 获取结果数量
	results=gg.getResultCount()
	-- 判断
	if results<8 then
		-- 清除
		gg.clearResults()
		gg.setRanges(32)
		-- 第二次搜索
		gg.searchNumber("0.0001E;"..n.."::30", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
		gg.refineNumber(n, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
		-- 第二次搜索结果修改
		gg.getResults(8)
		gg.editAll("1", gg.TYPE_DWORD)
	else
		-- 第一次搜索结果修改
		gg.getResults(8)
		gg.editAll("1", gg.TYPE_DOUBLE)
	end
	-- 清除
	gg.clearResults()
	gg.toast("还原成功")
end

function exit()
    gg.alert("退出成功")
	os.exit()
end

-- 循环
-- while true do
-- 	if gg.isVisible(true) then
-- 		FX=nil
-- 		gg.setVisible(false)
-- 	end
	gg.clearResults()
	-- if FX==nil then
		Main0()
-- 	end
-- end