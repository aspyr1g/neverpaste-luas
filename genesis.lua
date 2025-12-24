local l_pui_0 = (function ()
    local a=1;local print,require,print_raw,print_error,color,next,vector,type,pairs,ipairs,getmetatable,setmetatable,assert,rawget,rawset,rawequal,rawlen,unpack,select,tonumber,tostring,error,pcall,xpcall,print_dev=print,require,print_raw,print_error,color,next,vector,type,pairs,ipairs,getmetatable,setmetatable,assert,rawget,rawset,rawequal,rawlen,unpack,select,tonumber,tostring,error,pcall,xpcall,print_dev;local b=function(c)local d={}for e,f in next,c do d[e]=f end;return d end;local table,math,string,ui=b(table),b(math),b(string),b(ui)table.find=function(c,g)for e,f in next,c do if f==g then return e end end;return false end;table.ifind=function(c,g)for h=1,table.maxn(c)do if c[h]==g then return h end end end;table.ihas=function(c,...)local i={...}for h=1,table.maxn(c)do for g=1,#i do if c[h]==i[g]then return true end end end;return false end;table.filter=function(c)local j={}for h=1,table.maxn(c)do if c[h]~=nil then j[#j+1]=c[h]end end;return j end;table.append=function(c,...)for h,f in ipairs{...}do table.insert(c,f)end end;table.appendf=function(c,...)local i={...}for h=1,table.maxn(i)do local f=i[h]if f~=nil then c[#c+1]=f end end end;table.range=function(c,h,g)local k={}for l=h or 0,g or#c do k[#k+1]=c[l]end;return k end;table.copy=function(m)if type(m)~="table"then return m end;local k={}for e,f in next,m do k[table.copy(e)]=table.copy(f)end;return k end;math.round=function(n)return math.floor(n+0.5)end;math.lerp=function(o,p,q)return o+(p-o)*q end;local r=function(d,o,p)if d then return o else return p end end;local s=function(o,t,u)if not o then error(t,u and u+1 or 4)end end;local v=function(w,x,...)local c={pcall(w,...)}if not c[1]then if type(x)=="function"then return x(c[2])else error(c[2],x or 2)end end;return unpack(c,2)end;local y=setmetatable({warning=function(...)end,error=function(...)cvar.play:call("ui/menu_invalid.wav")error()end},{__call=function(self,...)if _IS_MARKET then return end;end})local z={execute=function(c,A,w)local B,e;for C,D in ipairs(A)do e,B,c=D,c,c[D]if c==nil then return end end;if B[e]~=nil then w(B[e],B)end end,replace=function(c,A,n)local B,e;for C,D in ipairs(A)do e,B,c=D,c,c[D]if c==nil then return end end;B[e]=n end,find=function(c,A)local B,e;for C,D in ipairs(A)do e,B,c=D,c,c[D]if type(c)~="table"then break end end;return B[e]end}z.pave=function(c,E,A)local B=c;for h,f in ipairs(A)do if type(B[f])=="table"then B=B[f]else B[f]=h<#A and{}or E;B=B[f]end end;return c end;z.extract=function(c,A)if not A or#A==0 then return c end;local g=z.find(c,A)return z.pave({},g,A)end;local F,G,H={},{},{element={},group={}}local I,J={},{}local K,L={},false;local M;local N=render.get_scale(1)local O={switch={type="boolean",arg=2},slider={type="number",arg=6},combo={type="string",arg=2,variable=true},language={type="string",arg=2,variable=true},selectable={type="table",arg=2,variable=true},button={type="function",arg=3,unsavable=true},list={type="number",arg=2,variable=true},listable={type="table",arg=2,variable=true},label={type="string",arg=1,unsavable=true},texture={type="userdata",arg=5,unsavable=true},image={type="userdata",arg=5,unsavable=true},hotkey={type="number",arg=2},input={type="string",arg=2},textbox={type="string",arg=2},color_picker={type="userdata",arg=2},value={type="any",arg=2},["sol.lua::LuaVarClr"]={type="userdata",arg=2},[""]={type="any",arg=2}}local P={group={},wrp_group={},element={},wrp_element={},events={}}do local Q=ui.find("Miscellaneous","Main","Movement","Air Duck")local R=Q:parent()local S,T={"__eq","__index","__name","__type","color_picker","create","disabled","export","get","get_override","id","import","key","list","name","new","override","parent","reset","set","set_callback","tooltip","type","unset_callback","update","visibility"},{"__eq","__index","__name","__type","button","color_picker","combo","create","disabled","export","hotkey","import","input","label","list","listable","name","parent","selectable","slider","switch","texture","value","visibility"}for h=1,#S do local e=S[h]local f=Q[e]P.element[e],P.wrp_element[e]=f,function(self,...)return f(self.ref,...)end end;for h=1,#T do local e=T[h]local f=R[e]P.group[e],P.wrp_group[e]=f,function(self,...)return f(self.ref,...)end end end;local U=setmetatable({},{__mode="k",__index=function(self,V)local W=ui.get_icon(V)if#W==0 then y.warning(W,("<%s> icon not found"):format(V))return"[?]"end;self[V]=W;return self[V]end})local X=setmetatable({},{__mode="k",__index=function(self,Y)local Z,R;local _=type(Y)if _=="table"then if Y.__name=="pui::group"then return Y.ref end;for h=1,#Y do Y[h]=I.format(Y[h])end;Z,R=Y[1].."-"..(Y[2]or""),ui.create(unpack(Y))elseif _=="userdata"and Y.__name=="sol.lua::LuaGroup"then Z,R=tostring(Y),Y else Y=I.format(Y)Z,R=tostring(Y),ui.create(Y)end;self[Z]=R;return self[Z]end})do local a0={gradients=function(a1,a2)local a3={}for q in string.gmatch(a1,"\b%x+")do a3[#a3+1]=color(string.sub(q,2))end;if#a3>0 then return I.gradient(a2,a3)end end,colors=function(a1)return F.colors[a1]and"\a"..F.colors[a1]:to_hex()or"\aDEFAULT"end,macros=setmetatable({},{__newindex=function(self,Z,n)local a4=type(n)if a4=="string"then elseif a4=="userdata"and n.__name=="sol.ImColor"then n="\a"..n:to_hex()else n=tostring(n)end;rawset(self,tostring(Z),n)end,__index=function(self,Z)return rawget(self,Z)end})}F.macros=a0.macros;I.format=function(D)if type(D)=="string"then if M then M[D]=true end;D=string.gsub(D,"\b<(.-)>",a0.macros)D=string.gsub(D,"[\v\r]",{["\v"]="\a{Link Active}",["\r"]="\aDEFAULT"})D=string.gsub(D,"([\b%x]-)%[(.-)%]",a0.gradients)D=string.gsub(D,"\a%[(.-)%]",a0.colors)D=string.gsub(D,"\f<(.-)>",U)end;return D end;I.gradient=function(a2,a3)local a5,a6={},#a2:gsub(".[\128-\191]*","a")local D=1/(#a3-1)local h=0;for a7 in string.gmatch(a2,".[\128-\191]*")do h=h+1;local a8=h/a6;local a9=a8/D;local g=math.ceil(a9)local q=a9/g;local aa,ab=a3[g],a3[g+1]local k=aa.r+(ab.r-aa.r)*q;local ac=aa.g+(ab.g-aa.g)*q;local p=aa.b+(ab.b-aa.b)*q;local o=aa.a+(ab.a-aa.a)*q;a5[#a5+1]=("\a%02x%02x%02x%02x%s"):format(k,ac,p,o,a7)end;a5[#a5+1]="\aDEFAULT"return table.concat(a5)end end;do J.new=function(ad)local ae={ref=ad}ae.__depend={{},{}}ae[0],ae[1]={type=P.element.type(ae.ref),events={},callbacks={}},{}ae[0].savable=not O[ae[0].type].unsavable==true;if ae[0].type~="button"then local af,ag=P.element.get(ae.ref)if ag~=nil then ae.value={af,ag}P.element.set_callback(ae.ref,function(self)ae.value={P.element.get(self)}end)else ae.value=af;P.element.set_callback(ae.ref,function(self)ae.value=P.element.get(self)end)end end;return setmetatable(ae,H.element)end;J.group=function(ad)return setmetatable({ref=ad,par=ad:parent(),__depend={{},{}}},H.group)end;J.dispense=function(Z,...)local ah,ai={...},O[Z]ah.n=table.maxn(ah)local aj,ak=ai and ai.variable and type(ah[2])=="string",1;ah.req,ah.misc=ai and not aj and ai.arg or ah.n,{}for h=1,ah.n do local f=ah[h]local _=type(f)if h==2 and ai.variable and not aj then for g=1,#f do f[g]=I.format(f[g])end else ah[h]=I.format(f)end;if _=="userdata"and f.__name=="sol.Vector"then ah[h]=f*N end;if h>ah.req then ah.misc[ak],ak=f,ak+1 end end;return ah end;J.memorize=function(self,A,al)if type(self)~="table"or self.__name~="pui::element"or self[0].skipsave then return end;al=al or K;local am=false;if self[0].savable then z.pave(al,self.ref,A)am=true end;if rawget(self,"color")then local an=table.copy(A)an[#an]=(am and"*"or"")..A[#A]z.pave(al,self.color.ref,an)elseif next(self[1])then local an,ao=table.copy(A),{}an[#an]=(am and"~"or"")..A[#A]for e,f in next,self[1]do if f[0].savable and not f[0].skipsave then ao[e]=f.ref;if rawget(f,"color")then ao["*"..e]=f.color.ref end end end;z.pave(al,ao,an)end end;J.features=function(self,ah)if self[0].type=="image"or self[0].type=="value"then return end;local ap,aq=false,false;for h=1,table.maxn(ah)do local f=ah[h]local c=type(f)if not ap and c=="function"then local d;H.element.create(self)self[1],d=f(self[0].gear,self)if d~=nil then self[0].gear:depend{self,d}end;ap=true elseif not ap and(c=="userdata"and f.__name=="sol.ImColor")or c=="table"and(f[1]and f[1].__name=="sol.ImColor"or f[next(f)]and f[next(f)][1].__name=="sol.ImColor")then local ar=c=="table"local ac=ar and f[1]or f;local as=f[2]H.element.color_picker(self,ac)if as~=nil then self.color:depend{self,as}end;ap=true elseif not aq and c=="string"or c=="table"and type(f[1])=="string"then P.element.tooltip(self.ref,I.format(f))aq=true elseif h==2 and f==false then self[0].skipsave=true end end end;local at={combo=function(f)if f[3]==true then return f[1].value~=f[2]else for h=2,#f do if f[1].value==f[h]then return true end end end;return false end,list=function(f)if f[3]==true then return f[1].value~=f[2]else for h=2,#f do if f[1].value==f[h]then return true end end end;return false end,selectable=function(f)if f[2]==true then return#f[1].value>0 elseif f[3]==true then return not table.ihas(f[1].value,unpack(f,2))else return table.ihas(f[1].value,unpack(f,2))end end,listable=function(f)if f[2]==true then return#f[1].value>0 elseif f[3]==true then return not table.ihas(f[1].value,unpack(f,2))else return table.ihas(f[1].value,unpack(f,2))end end,slider=function(f)return f[2]<=f[1].value and f[1].value<=(f[3]or f[2])end}local au=function(f)local av=false;if type(f[2])=="function"then av=f[2](f[1])else local aw=at[f[1][0].type]if aw then av=aw(f)else av=f[1].value==f[2]end end;return av and true or false end;J.dependant=function(ax,ay,az)local aA=0;for h=1,#ax do aA=aA+(au(ax[h])and 1 or 0)end;local aB=aA>=#ax;local _=ay.__name=="sol.lua::LuaGroup"and"group"or"element"P[_][az and"disabled"or"visibility"](ay,r(az,not aB,aB))end end;F.version=a;F.colors={}F.accent,F.alpha=ui.get_style("Link Active"),ui.get_alpha()F.menu_position,F.menu_size=ui.get_position(),ui.get_size()events.render:set(function()F.accent,F.alpha=ui.get_style("Link Active"),ui.get_alpha()F.menu_position,F.menu_size=ui.get_position(),ui.get_size()end)F.string=I.format;F.create=function(aC,V,aD)if type(V)=="table"then local aE={}for e,f in ipairs(V)do aE[f[1]or e]=J.group(X[{aC,f[2],f[3]}])end;return aE else return J.group(X[V and{aC,V,aD}or aC])end end;F.find=function(...)local i={...}local aF;for h,f in ipairs(i)do if type(f)=="table"then aF,i[h]=f,nil;break end end;local aG={ui.find(unpack(i))}for h,f in ipairs(aG)do aG[h]=J[f.__name=="sol.lua::LuaGroup"and"group"or"new"](f)end;if aG[2]and aG[2].ref.__name=="sol.lua::LuaVar"then aG[1].color,aG[2]=aG[2],nil elseif aF and aG[1]then for e,f in next,aF do local A={...}A[#A]=f;aG[1][1][e]=F.find(unpack(A))end end;return aG[1]end;F.sidebar=function(V,W)V,W=I.format(V),W and I.format(W)or nil;ui.sidebar(V,W)end;F.get_icon=function(V)return U[V]end;F.traverse=function(c,aw,B)B=B or{}if type(c)=="table"and(c.__name~="pui::element"and c.__name~="pui::group")and c[#c]~="~"then for e,f in next,c do local aH=table.copy(B)aH[#aH+1]=e;F.traverse(f,aw,aH)end else aw(c,B)end end;F.translate=function(aI,aJ)aI=I.format(aI)for e,f in next,aJ or{}do ui.localize(e,aI,I.format(f))end;return aI end;do local aK={create=function(self,V,aD)return J.group(P.group.create(self[1],I.format(V),aD))end}aK.__index=aK;local aL=ui.find("Aimbot","Anti Aim"):parent():parent()local aM={}F.category=function(V,aC)V,aC=tostring(I.format(V)),tostring(I.format(aC))local ad=v(ui.find,function()end,V,aC)if not aM[V]then aM[V]={}if not ad then aM[V][0]=aL:create(V)end end;if not aM[V][aC]then if ad then aM[V][aC]=ad else aM[V][aC]=aM[V][0]:create(aC)end end;return setmetatable({aM[V][aC]},aK)end end;F.string_recorder={open=function()M={}end,close=function()if M then local aN,aA={},0;for e,f in next,M do aA=aA+1;aN[aA]=e end;M=nil;return aN end end}do F.is_loading_config,F.is_saving_config=false,false;local function aO(c,aw,B)B=B or{}if type(c)=="table"and c._S==nil then for e,f in next,c do local aH=table.copy(B)aH[#aH+1]=e;aO(f,aw,aH)end else aw(c,B)end end;local aP=function(c)local aQ={}aO(c,function(f,B)if type(f)=="table"and f._S~=nil then if f._C then local a1=table.copy(B)a1[#a1]="*"..a1[#a1]z.pave(aQ,f._C,a1)z.pave(aQ,f._S,B)else local ao=table.copy(f)ao._S=nil;for aR,aS in next,ao do if type(aS)=="table"and aS._C then ao["*"..aR],ao[aR]=aS._C,aS._S end end;local aT=table.copy(B)aT[#aT]="~"..aT[#aT]z.pave(aQ,ao,aT)z.pave(aQ,f._S,B)end else z.pave(aQ,f,B)end end)return aQ end;local aU=function(aV,i)if type(i[1])=="table"then local k={}for h,f in ipairs(i)do local as=z.find(aV,f)z.pave(k,as,f)end;return k else return z.extract(aV,i)end end;local aW=function(al,...)F.is_saving_config=true;local i,aX={...},{}F.traverse(aU(al,i),function(ad,A)local aY=P.element.type(ad)local n,aZ=P.element[aY=="hotkey"and"key"or"get"](ad)local a_,b0=type(n),type(aZ)if aY=="color_picker"then if a_=="table"then aZ,b0=n,a_;n,a_=P.element.list(ad)[1],"string"end;if aZ then n={n}if b0=="table"then for h=1,#aZ do n[#n+1]="#"..aZ[h]:to_hex()end else n[2]="#"..aZ:to_hex()end;n[#n+1]="~"else n="#"..n:to_hex()end elseif a_=="table"then n[#n+1]="~"end;z.pave(aX,n,A)end)F.is_saving_config=false;return aX end;local b1=function(al,b2,...)if not b2 then return end;local i,b3={...},true;if i[1]==false then table.remove(i,1)b3=false end;F.is_loading_config=true;local aX=aP(aU(b2,i))F.traverse(aU(al,i),function(ad,A)local n=z.find(aX,A)local b4;local a_,aY=type(n),P.element.type(ad)local b5=O[aY]or O[ad.__name]if aY=="color_picker"then if a_=="string"and n:sub(1,1)=="#"then n=color(n)a_="userdata"elseif a_=="table"then n[#n]=nil;for h=2,#n do n[h]=color(n[h])end;b4=true;a_="userdata"end elseif a_=="table"and n[#n]=="~"then n[#n]=nil end;if not b5 or b5.type~="any"and b5.type~=a_ then return b3 and P.element.reset(ad)or nil end;pcall(function()if aY=="hotkey"then P.element.key(ad,n)elseif aY=="color_picker"and b4 then P.element.set(ad,n[1])P.element.set(ad,n[1],table.range(n,2))else P.element.set(ad,n)end end)end)F.is_loading_config=false end;local b6={__type="pui::package",__metatable=false,__call=function(self,Y,...)return(type(Y)=="table"and b1 or aW)(self[0],Y,...)end,save=function(self,...)return aW(self[0],...)end,load=function(self,...)b1(self[0],...)end}b6.__index=b6;F.setup=function(c,b7)if b7==true then local b8={[0]={}}F.traverse(c,function(k,B)J.memorize(k,B,b8[0])end)return setmetatable(b8,b6)else if L then return y.warning("config is already setup by this or another script")end;F.traverse(c,J.memorize)L=true;return c end end;F.save=function(...)return aW(K,...)end;F.load=function(...)b1(K,...)end end;H.element={__metatable=false,__type="pui::element",__name="pui::element",__tostring=function(self)return string.format("pui::element.%s \"%s\"",self[0].type,self.ref:name())end,__eq=function(o,p)return P.element.__eq(o.ref,p.ref)end,__index=function(self,Z)return rawget(H.element,Z)or rawget(P.wrp_element,Z)or rawget(self[1],Z)end,__call=function(self,...)return(#{...}==0 and P.element.get or P.element.set)(self.ref,...)end,create=function(self)self[0].gear=self[0].gear or J.group(P.element.create(self.ref))return self[0].gear end,depend=function(self,...)local i={...}local az=i[1]==true;local ax=self.__depend[az and 2 or 1]for h=az and 2 or 1,table.maxn(i)do local f=i[h]if f then if f.__name=="pui::element"then f={f,true}end;f[0]=false;ax[#ax+1]=f;local b9=function()J.dependant(ax,self.ref,az)end;b9()P.element.set_callback(f[1].ref,b9)end end;return self end,name=function(self,D)if D then P.element.name(self.ref,I.format(D))else return P.element.name(self.ref)end end,set_name=function(self,D)P.element.name(self.ref,I.format(D))end,get_name=function(self)return P.element.name(self.ref)end,type=function(self)return self[0].type end,get_type=function(self)return self[0].type end,list=function(self)return P.element.list(self.ref)end,get_list=function(self)return P.element.list(self.ref)end,update=function(self,...)P.element.update(self.ref,...)if self[0].type=="list"or self[0].type=="listable"then local n,aN=P.element.get(self.ref),P.element.list(self.ref)if not aN then return end;local ba=#aN;if type(n)=="number"then if n>ba then P.element.set(self.ref,ba)self.value=ba end else local bb=table.ifind(aN,n)if bb==nil or bb>ba then P.element.set(self.ref,aN[ba])self.value=aN[ba]end end end end,tooltip=function(self,c)if c then P.element.tooltip(self.ref,I.format(c))else return P.element.tooltip(self.ref)end end,set_tooltip=function(self,c)P.element.tooltip(self.ref,I.format(c))end,get_tooltip=function(self)return P.element.tooltip(self.ref)end,set_visible=function(self,f)P.element.visibility(self.ref,f)end,get_visible=function(self)P.element.visibility(self.ref)end,set_disabled=function(self,f)P.element.disabled(self.ref,f)end,get_disabled=function(self)P.element.disabled(self.ref)end,get_color=function(self)return rawget(self,"color")and self.color.value end,color_picker=function(self,bc)self.color=J.new(P.element.color_picker(self.ref,bc))return self.color end,set_event=function(self,bd,be,av)if av==nil then av=true end;local bf,bg=type(av)=="function",be;self[0].events[be]=function()local bh;if bf then bh=av(self)and true or false else bh=self.value==av end;if bg~=bh then events[bd](be,bh)bg=bh end end;self[0].events[be]()P.element.set_callback(self.ref,self[0].events[be])end,unset_event=function(self,bd,be)events[bd].unset(events[bd],be)P.element.unset_callback(self.ref,self[0].events[be])self[0].events[be]=nil end,set_callback=function(self,be,bi)self[0].callbacks[be]=function()be(self)end;P.element.set_callback(self.ref,self[0].callbacks[be],bi)end,unset_callback=function(self,be)if self[0].callbacks[be]then P.element.unset_callback(self.ref,self[0].callbacks[be])self[0].callbacks[be]=nil end end,override=function(self,...)P.element.override(self.ref,...)end,get_override=function(self)return P.element.get_override(self.ref)end}H.group={__name="pui::group",__metatable=false,__index=function(self,Z)return H.group[Z]or(O[Z]and G.__index(self,Z)or P.wrp_group[Z])end,name=function(self,D,c)local ad=c==true and self.par or self.ref;if D then P.group.name(ad,I.format(D))else return P.group.name(ad)end end,set_name=function(self,D,c)P.group.name(c==true and self.par or self.ref,I.format(D))end,get_name=function(self,c)return P.group.name(c==true and self.par or self.ref)end,disabled=function(self,p,c)local ad=c==true and self.par or self.ref;if p~=nil then P.group.disabled(ad,p)else return P.group.disabled(ad)end end,set_disabled=function(self,p,c)P.group.disabled(c==true and self.par or self.ref,p and true or false)end,get_disabled=function(self,c)return P.group.disabled(c==true and self.par or self.ref)end,set_visible=function(self,p)P.group.visibility(self.ref,p and true or false)end,get_visible=function(self)return P.group.visibility(self.ref)end,depend=H.element.depend}do local bj={}for Z in next,O do bj[Z]=function(bk,...)local bl=bk.__name=="pui::group"local R=bl and bk.ref or X[bk]local ah=J.dispense(Z,...)local ae=J.new(P.group[Z](R,unpack(ah,1,ah.n<ah.req and ah.n or ah.req)))J.features(ae,ah.misc)return ae end end;G.__metatable=false;G.__name="pui::basement"G.__index=function(self,Z)if not O[Z]then return ui[Z]end;return bj[Z]end end;return setmetatable(F,G)
end)()
local l_base64_0 = (function()
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    
    local function decode(data)
        data = string.gsub(data, '[^'..b..'=]', '')
        return (data:gsub('.', function(x)
            if (x == '=') then return '' end
            local r,f='', (b:find(x)-1)
            for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
            return r;
        end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
            if (#x ~= 8) then return '' end
            local c=0
            for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
            return string.char(c)
        end))
    end
    
    local function encode(data)
        return ((data:gsub('.', function(x) 
            local r,b='',x:byte()
            for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
            return r;
        end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
            if (#x < 6) then return '' end
            local c=0
            for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
            return b:sub(c+1,c+1)
        end)..({ '', '==', '=' })[#data%3+1])
    end

    return {decode = decode, encode = encode}
end)()
local l_clipboard_0 = (function ()
    local a=ffi.typeof'char[?]'local b=utils.get_vfunc('vgui2.dll','VGUI_System010',7,'int(__thiscall*)(void*)')local c=utils.get_vfunc('vgui2.dll','VGUI_System010',9,'void(__thiscall*)(void*, const char*, int)')local d=utils.get_vfunc('vgui2.dll','VGUI_System010',11,'int(__thiscall*)(void*, int, const char*, int)')local function e()local f=b()if f>0 then local g=a(f)d(0,g,f)return ffi.string(g,f-1)end end;local function h(...)local i=tostring(table.concat({...}))c(i,string.len(i))end;return{set=h,get=e}
end)()
local l_gradient_0 = (function()
    r0_0 = "[%z\u{1}-\u{7f}\xc2-\xf4][\x80-\xbf]*"

    local function r1_0(r0_31, r1_31)
      if r0_31 < 0 then
        r0_31 = r1_31 + r0_31 + 1
      end
      return r0_31
    end
    
    r2_0 = { -- REMOVED 'local'
      map = function(r0_30, r1_30, r2_30)
        local r3_30 = 0
        if r2_30 then
          for r7_30, r8_30 in r0_30.gmatch(r0_30, "()" .. r0_0 .. "()") do
            r3_30 = r3_30 + 1
            r1_30(r3_30, r8_30 - r7_30, r7_30)
          end
        else
          for r7_30, r8_30 in r0_30.gmatch(r0_30, "()(" .. r0_0 .. ")") do
            r3_30 = r3_30 + 1
            r1_30(r3_30, r8_30, r7_30)
          end
        end
      end,
      chars = function(r0_28, r1_28)
        return coroutine.wrap(function()
          return r2_0.map(r0_28, coroutine.yield, r1_28)
        end)
      end,
      len = function(r0_27)
        return select(2, r0_27:gsub("[^\x80-\xc1]", ""))
      end,
      replace = function(r0_26, r1_26)
        return r0_26:gsub(r0_0, r1_26)
      end,
      reverse = function(r0_24)
        r0_24 = r0_24:gsub(r0_0, function(r0_25)
          local r1_25 = #r0_25
          if r1_25 > 1 then
            r1_25 = r0_25:reverse()
          else
            r1_25 = false
          end
          return r1_25
        end)
        return r0_24:reverse()
      end,
      strip = function(r0_22)
        return r0_22:gsub(r0_0, function(r0_23)
          local r1_23 = #r0_23
          if r1_23 > 1 then
            r1_23 = ""
          else
            r1_23 = false
          end
          return r1_23
        end)
      end,
      sub = function(r0_21, r1_21, r2_21)
        local r3_21 = r2_0.len(r0_21)
        r1_21 = r1_0(r1_21, r3_21)
        if r2_21 then
          r2_21 = r1_0(r2_21, r3_21)
          if not r2_21 then
            r2_21 = r3_21
          end
        else
          r2_21 = r3_21
        end
        if r1_21 < 1 then
          r1_21 = 1
        end
        if r3_21 < r2_21 then
          r2_21 = r3_21
        end
        if r2_21 < r1_21 then
          return ""
        end
        local r4_21 = r2_21 - r1_21
        local r5_21 = r2_0.chars(r0_21, true)
        for r9_21 = 1, r1_21 - 1, 1 do
          r5_21()
        end
        local r6_21, r7_21 = select(2, r5_21())
        if r4_21 == 0 then
          return string.sub(r0_21, r7_21, r7_21 + r6_21 - 1)
        end
        r1_21 = r7_21
        for r11_21 = 1, r4_21 - 1, 1 do
          r5_21()
        end
        r6_21, r7_21 = select(2, r5_21())
        return string.sub(r0_21, r1_21, r7_21 + r6_21 - 1)
      end,
    }
    
    function r3_0(r0_20) -- REMOVED 'local'
      if #r0_20 < 2 then
        error("2 or more colors required!")
      end
      if r0_20[1][2] ~= 0 then
        error("First color must start at position 0!")
      end
      if r0_20[#r0_20][2] ~= 1 then
        error("Last color must end at position 1!")
      end
      local r1_20 = 0
      for r5_20, r6_20 in ipairs(r0_20) do
        local r7_20 = r6_20[2]
        if not r7_20 then
          error("Color doesn\'t have a stop property!")
        end
        if r7_20 < 0 or 1 < r7_20 then
          error("Color stop is out of boundaries!")
        end
        if r1_20 <= r7_20 then
          r1_20 = r7_20
        else
          error("Color stops are out of order!")
        end
      end
      return r0_20
    end
    
    function r4_0(r0_19, r1_19, r2_19) -- REMOVED 'local'
      r1_19 = (r1_19 + r2_19 - 1) % #r0_19 + 1
      return r0_19[r1_19], r1_19
    end
    
    function r5_0(r0_18, r1_18) -- REMOVED 'local'
      return color((r0_18.r / 255) ^ (r1_18 / 1) * 255, (r0_18.g / 255) ^ (r1_18 / 1) * 255, (r0_18.b / 255) ^ (r1_18 / 1) * 255)
    end
    
    function r6_0(r0_17, r1_17) -- REMOVED 'local'
      local r2_17 = #r0_17
      local r4_17 = r1_17 / (r2_17 - 1) / 1
      local r5_17 = math.floor(r4_17) + 1
      if r4_17 == r2_17 - 1 then
        return r0_17[r2_17]
      end
      return r0_17[r5_17]:lerp(r0_17[r5_17 + 1], r4_17 % 1)
    end
    
    local r7_0 = {}
    local r8_0 = {}
    r8_0.__index = r8_0
    local r9_0 = {}
    r9_0.__index = r9_0
    
    function r8_0.linear(r0_16, r1_16)
      if type(r0_16[1]) ~= "table" then
        return r6_0(r0_16, r1_16)
      end
      local r2_16 = r3_0(r0_16)
      local r3_16 = 1
      while r2_16[r3_16 + 1][2] < r1_16 do
        r3_16 = r3_16 + 1
      end
      return r2_16[r3_16][1]:lerp(r2_16[r3_16 + 1][1], (r1_16 - r2_16[r3_16][2]) / (r2_16[r3_16 + 1][2] - r2_16[r3_16][2]))
    end
    
    function r8_0.text(r0_15, r1_15, r2_15)
      local r3_15 = ""
      local r4_15 = r2_0.len(r0_15) - 1
      for r8_15, r9_15, r10_15 in r2_0.chars(r0_15) do
        local r12_15 = r8_0.linear(r2_15, (r8_15 - 1) / r4_15):to_hex()
        if r1_15 then
          r12_15 = r12_15:sub(1, 6)
        end
        r3_15 = string.format("%s\u{7}%s%s", r3_15, r12_15, r2_0.sub(r0_15, r8_15, r8_15))
      end
      return r3_15
    end
    
    function r8_0.text_animate(r0_14, r1_14, r2_14)
      local r3_14 = r0_14 .. r1_14
      for r7_14, r8_14 in ipairs(r2_14) do
        r3_14 = r3_14 .. tostring(r8_14)
      end
      local r4_14 = r7_0[r3_14]
      if not r4_14 then
        r4_14 = setmetatable({}, r9_0)
        r4_14.text = r0_14
        r4_14.animated_text = ""
        r4_14.speed = r1_14 / 1
        r4_14.current_pos = 0
        r4_14.colors = r2_14
        local r6_14 = r4_14.colors
        r4_14.colors[#r0_14 + 1] = r4_14.colors[1]
        r4_14:populate_gradient()
      end
      r7_0[r3_14] = r4_14
      return r4_14
    end
    
    function r9_0.populate_gradient(r0_13)
      local r1_13 = r0_13:get_colors()
      local r2_13 = r0_13:get_text()
      local r3_13 = {}
      local r6_13 = r2_13 .. string.rep("|", math.floor(r2_0.len(r2_13) / (#r0_13 - 2) + 0.5))
      local r7_13 = r2_0.len(r6_13)
      for r11_13, r12_13, r13_13 in r2_0.chars(r6_13) do
        r3_13[#r0_13 + 1] = r8_0.linear(r1_13, (r11_13 - 1) / (r7_13 - 1)):to_hex()
      end
      r0_13.gradients = r3_13
      r0_13:populate_text()
    end
    
    function r9_0.populate_text(r0_12)
      local r1_12 = r0_12.text
      r0_12.animated_text = ""
      for r5_12, r6_12, r7_12 in r2_0.chars(r1_12) do
        r0_12.animated_text = string.format("%s\u{7}%s%s", r0_12.animated_text, r4_0(r0_12.gradients, r5_12, 0), r2_0.sub(r1_12, r5_12, r5_12))
      end
    end
    
    function r9_0.animate(r0_11)
      if math.abs(r0_11.current_pos) >= 1 then
        r0_11.current_pos = r0_11.speed * globals.frametime
      end
      r0_11.animated_text = ""
      r0_11.current_pos = r0_11.current_pos + r0_11.speed * globals.frametime
      local r1_11 = r0_11.text
      local r4_11 = r0_11.gradients
      local r2_11 = math.floor(r0_11.current_pos * #r0_11)
      for r6_11, r7_11, r8_11 in r2_0.chars(r1_11) do
        r0_11.animated_text = string.format("%s\u{7}%s%s", r0_11.animated_text, r4_0(r0_11.gradients, r6_11, r2_11), r2_0.sub(r1_11, r6_11, r6_11))
      end
    end
    
    function r9_0.get_colors(r0_10)
      return r0_10.colors
    end
    
    function r9_0.set_colors(r0_9, r1_9)
      local r2_9 = false
      for r6_9, r7_9 in ipairs(r1_9) do
        if r0_9.colors[r6_9] ~= r7_9 then
          r2_9 = true
        end
      end
      if r2_9 then
        r0_9.colors = r1_9
        local r4_9 = r0_9.colors
        r0_9.colors[#r0_9 + 1] = r0_9.colors[1]
        r0_9:populate_gradient()
      end
    end
    
    function r9_0.get_speed(r0_8)
      return r0_8.speed / 1
    end
    
    function r9_0.set_speed(r0_7, r1_7)
      r0_7.speed = r1_7 / 1
    end
    
    function r9_0.get_current_position(r0_6)
      return r0_6.current_pos
    end
    
    function r9_0.set_current_position(r0_5, r1_5)
      r0_5.current_pos = math.clamp(r1_5, -1, 1)
      r0_5.animated_text = ""
      local r2_5 = r0_5.text
      local r5_5 = r0_5.gradients
      local r3_5 = math.floor(r0_5.current_pos * #r0_5)
      for r7_5, r8_5, r9_5 in r2_0.chars(r2_5) do
        r0_5.animated_text = string.format("%s\u{7}%s%s", r0_5.animated_text, r4_0(r0_5.gradients, r7_5, r3_5), r2_0.sub(r2_5, r7_5, r7_5))
      end
    end
    
    function r9_0.get_text(r0_4)
      return r0_4.text
    end
    
    function r9_0.set_text(r0_3, r1_3)
      if r0_3.text ~= r1_3 then
        r0_3.text = r1_3
        r0_3:populate_gradient()
      end
    end
    
    function r9_0.get_animated_text(r0_2)
      return r0_2.animated_text
    end
    
    function r9_0.gamma_correct(r0_1, r1_1)
      for r5_1, r6_1 in ipairs(r0_1.gradients) do
        r0_1.gradients[r5_1] = r5_0(color(r6_1), r1_1):to_hex()
      end
    end
    return r8_0
end)()
local l_system_0 = (function ()
local is_menu_visible = false
local check_menu_events = function()
    is_menu_visible = ui.get_alpha() == 1
end

events.render:set(check_menu_events)
--- @endregion

--- @region: create library structure
local system = {}
local screen_size = render.screen_size()

system.list = {}
system.windows = {}

--- @param position: {x_menu_element, y_menu_element}
--- @param size: vector(x, y)
--- @param global_name: string
--- @param ins_function: function(self) -> render here

system.__index = system
system.register = function(position, size, global_name, ins_function)
    local data = {
        size = size,
        position = vector(position[1]:get(), position[2]:get()),

        is_dragging = false,
        drag_position = vector(),

        global_name = global_name,
        ins_function = ins_function,

        ui_callbacks = {x = position[1], y = position[2]}
    }

    table.insert(system.windows, data)
    return setmetatable(data, system)
end

function system:limit_positions()
    if self.position.x <= 0 then
        self.position.x = 0
    end

    if self.position.x + self.size.x >= screen_size.x - 1 then
        self.position.x = screen_size.x - self.size.x - 1
    end

    if self.position.y <= 0 then
        self.position.y = 0
    end

    if self.position.y + self.size.y >= screen_size.y - 1 then
        self.position.y = screen_size.y - self.size.y - 1
    end
end

function system:is_in_area(mouse_position)
    return mouse_position.x >= self.position.x and mouse_position.x <= self.position.x + self.size.x and mouse_position.y >= self.position.y and mouse_position.y <= self.position.y + self.size.y
end

--- @note: call this at render functions
function system:update(...)
    if is_menu_visible then
        local mouse_position = ui.get_mouse_position()
        local is_in_area = self:is_in_area(mouse_position)

        local list = system.list
        local is_key_pressed = common.is_button_down(0x1)

        if (is_in_area or self.is_dragging) and is_key_pressed and (list.target == "" or list.target == self.global_name) then
            list.target = self.global_name
            if not self.is_dragging then
                self.is_dragging = true
                self.drag_position = mouse_position - self.position
            else
                self.position = mouse_position - self.drag_position
                self:limit_positions()

                self.ui_callbacks.x:set(math.floor(self.position.x))
                self.ui_callbacks.y:set(math.floor(self.position.y))
            end
        elseif not is_key_pressed then
            list.target = ""
            self.is_dragging = false
            self.drag_position = vector()
        end
    end
    self.ins_function(self, ...)
end

--- @note: call this while loading user configs
system.on_config_load = function()
    for _, point in pairs(system.windows) do
        point.position = vector(point.ui_callbacks.x:get(), point.ui_callbacks.y:get())
    end
end
return system
end)()
local v297 = (function()
    local v5 = {};
    local l_pow_0 = math.pow;
    local l_sin_0 = math.sin;
    local l_cos_0 = math.cos;
    local l_pi_0 = math.pi;
    local l_sqrt_0 = math.sqrt;
    local l_abs_0 = math.abs;
    local l_asin_0 = math.asin;
    local function v17(v13, v14, v15, v16)
        return v15 * v13 / v16 + v14;
    end;
    local function v22(v18, v19, v20, v21)
        -- upvalues: l_pow_0 (ref)
        return v20 * l_pow_0(v18 / v21, 2) + v19;
    end;
    local function v27(v23, v24, v25, v26)
        v23 = v23 / v26;
        return -v25 * v23 * (v23 - 2) + v24;
    end;
    local function v32(v28, v29, v30, v31)
        -- upvalues: l_pow_0 (ref)
        v28 = v28 / v31 * 2;
        if v28 < 1 then
            return v30 / 2 * l_pow_0(v28, 2) + v29;
        else
            return -v30 / 2 * ((v28 - 1) * (v28 - 3) - 1) + v29;
        end;
    end;
    local function v37(v33, v34, v35, v36)
        -- upvalues: v27 (ref), v22 (ref)
        if v33 < v36 / 2 then
            return v27(v33 * 2, v34, v35 / 2, v36);
        else
            return v22(v33 * 2 - v36, v34 + v35 / 2, v35 / 2, v36);
        end;
    end;
    local function v42(v38, v39, v40, v41)
        -- upvalues: l_pow_0 (ref)
        return v40 * l_pow_0(v38 / v41, 3) + v39;
    end;
    local function v47(v43, v44, v45, v46)
        -- upvalues: l_pow_0 (ref)
        return v45 * (l_pow_0(v43 / v46 - 1, 3) + 1) + v44;
    end;
    local function v52(v48, v49, v50, v51)
        v48 = v48 / v51 * 2;
        if v48 < 1 then
            return v50 / 2 * v48 * v48 * v48 + v49;
        else
            v48 = v48 - 2;
            return v50 / 2 * (v48 * v48 * v48 + 2) + v49;
        end;
    end;
    local function v57(v53, v54, v55, v56)
        -- upvalues: v47 (ref), v42 (ref)
        if v53 < v56 / 2 then
            return v47(v53 * 2, v54, v55 / 2, v56);
        else
            return v42(v53 * 2 - v56, v54 + v55 / 2, v55 / 2, v56);
        end;
    end;
    local function v62(v58, v59, v60, v61)
        -- upvalues: l_pow_0 (ref)
        return v60 * l_pow_0(v58 / v61, 4) + v59;
    end;
    local function v67(v63, v64, v65, v66)
        -- upvalues: l_pow_0 (ref)
        return -v65 * (l_pow_0(v63 / v66 - 1, 4) - 1) + v64;
    end;
    local function v72(v68, v69, v70, v71)
        -- upvalues: l_pow_0 (ref)
        v68 = v68 / v71 * 2;
        if v68 < 1 then
            return v70 / 2 * l_pow_0(v68, 4) + v69;
        else
            return -v70 / 2 * (l_pow_0(v68 - 2, 4) - 2) + v69;
        end;
    end;
    local function v77(v73, v74, v75, v76)
        -- upvalues: v67 (ref), v62 (ref)
        if v73 < v76 / 2 then
            return v67(v73 * 2, v74, v75 / 2, v76);
        else
            return v62(v73 * 2 - v76, v74 + v75 / 2, v75 / 2, v76);
        end;
    end;
    local function v82(v78, v79, v80, v81)
        -- upvalues: l_pow_0 (ref)
        return v80 * l_pow_0(v78 / v81, 5) + v79;
    end;
    local function v87(v83, v84, v85, v86)
        -- upvalues: l_pow_0 (ref)
        return v85 * (l_pow_0(v83 / v86 - 1, 5) + 1) + v84;
    end;
    local function v92(v88, v89, v90, v91)
        -- upvalues: l_pow_0 (ref)
        v88 = v88 / v91 * 2;
        if v88 < 1 then
            return v90 / 2 * l_pow_0(v88, 5) + v89;
        else
            return v90 / 2 * (l_pow_0(v88 - 2, 5) + 2) + v89;
        end;
    end;
    local function v97(v93, v94, v95, v96)
        -- upvalues: v87 (ref), v82 (ref)
        if v93 < v96 / 2 then
            return v87(v93 * 2, v94, v95 / 2, v96);
        else
            return v82(v93 * 2 - v96, v94 + v95 / 2, v95 / 2, v96);
        end;
    end;
    local function v102(v98, v99, v100, v101)
        -- upvalues: l_cos_0 (ref), l_pi_0 (ref)
        return -v100 * l_cos_0(v98 / v101 * l_pi_0 / 2) + v100 + v99;
    end;
    local function v107(v103, v104, v105, v106)
        -- upvalues: l_sin_0 (ref), l_pi_0 (ref)
        return v105 * l_sin_0(v103 / v106 * l_pi_0 / 2) + v104;
    end;
    local function v112(v108, v109, v110, v111)
        -- upvalues: l_cos_0 (ref), l_pi_0 (ref)
        return -v110 / 2 * (l_cos_0(l_pi_0 * v108 / v111) - 1) + v109;
    end;
    local function v117(v113, v114, v115, v116)
        -- upvalues: v107 (ref), v102 (ref)
        if v113 < v116 / 2 then
            return v107(v113 * 2, v114, v115 / 2, v116);
        else
            return v102(v113 * 2 - v116, v114 + v115 / 2, v115 / 2, v116);
        end;
    end;
    local function v122(v118, v119, v120, v121)
        -- upvalues: l_pow_0 (ref)
        if v118 == 0 then
            return v119;
        else
            return v120 * l_pow_0(2, 10 * (v118 / v121 - 1)) + v119 - v120 * 0.001;
        end;
    end;
    local function v127(v123, v124, v125, v126)
        -- upvalues: l_pow_0 (ref)
        if v123 == v126 then
            return v124 + v125;
        else
            return v125 * 1.001 * (-l_pow_0(2, -10 * v123 / v126) + 1) + v124;
        end;
    end;
    local function v132(v128, v129, v130, v131)
        -- upvalues: l_pow_0 (ref)
        if v128 == 0 then
            return v129;
        elseif v128 == v131 then
            return v129 + v130;
        else
            v128 = v128 / v131 * 2;
            if v128 < 1 then
                return v130 / 2 * l_pow_0(2, 10 * (v128 - 1)) + v129 - v130 * 5.0E-4;
            else
                return v130 / 2 * 1.0005 * (-l_pow_0(2, -10 * (v128 - 1)) + 2) + v129;
            end;
        end;
    end;
    local function v137(v133, v134, v135, v136)
        -- upvalues: v127 (ref), v122 (ref)
        if v133 < v136 / 2 then
            return v127(v133 * 2, v134, v135 / 2, v136);
        else
            return v122(v133 * 2 - v136, v134 + v135 / 2, v135 / 2, v136);
        end;
    end;
    local function v142(v138, v139, v140, v141)
        -- upvalues: l_sqrt_0 (ref), l_pow_0 (ref)
        return -v140 * (l_sqrt_0(1 - l_pow_0(v138 / v141, 2)) - 1) + v139;
    end;
    local function v147(v143, v144, v145, v146)
        -- upvalues: l_sqrt_0 (ref), l_pow_0 (ref)
        return v145 * l_sqrt_0(1 - l_pow_0(v143 / v146 - 1, 2)) + v144;
    end;
    local function v152(v148, v149, v150, v151)
        -- upvalues: l_sqrt_0 (ref)
        v148 = v148 / v151 * 2;
        if v148 < 1 then
            return -v150 / 2 * (l_sqrt_0(1 - v148 * v148) - 1) + v149;
        else
            v148 = v148 - 2;
            return v150 / 2 * (l_sqrt_0(1 - v148 * v148) + 1) + v149;
        end;
    end;
    local function v157(v153, v154, v155, v156)
        -- upvalues: v147 (ref), v142 (ref)
        if v153 < v156 / 2 then
            return v147(v153 * 2, v154, v155 / 2, v156);
        else
            return v142(v153 * 2 - v156, v154 + v155 / 2, v155 / 2, v156);
        end;
    end;
    local function v163(v158, v159, v160, v161)
        -- upvalues: l_abs_0 (ref), l_pi_0 (ref), l_asin_0 (ref)
        local v162 = v158 or v161 * 0.3;
        if not v159 then
            v159 = 0;
        end;
        v158 = v162;
        if v159 < l_abs_0(v160) then
            return v158, v160, v158 / 4;
        else
            return v158, v159, v158 / (2 * l_pi_0) * l_asin_0(v160 / v159);
        end;
    end;
    local function v174(v164, v165, v166, v167, v168, v169)
        -- upvalues: v163 (ref), l_pow_0 (ref), l_sin_0 (ref), l_pi_0 (ref)
        local v170 = nil;
        if v164 == 0 then
            return v165;
        else
            v164 = v164 / v167;
            if v164 == 1 then
                return v165 + v166;
            else
                local v171, v172, v173 = v163(v169, v168, v166, v167);
                v170 = v173;
                v168 = v172;
                v169 = v171;
                v164 = v164 - 1;
                return -(v168 * l_pow_0(2, 10 * v164) * l_sin_0((v164 * v167 - v170) * 2 * l_pi_0 / v169)) + v165;
            end;
        end;
    end;
    local function v185(v175, v176, v177, v178, v179, v180)
        -- upvalues: v163 (ref), l_pow_0 (ref), l_sin_0 (ref), l_pi_0 (ref)
        local _ = nil;
        if v175 == 0 then
            return v176;
        else
            v175 = v175 / v178;
            if v175 == 1 then
                return v176 + v177;
            else
                local v182, v183, v184 = v163(v180, v179, v177, v178);
                return v183 * l_pow_0(2, -10 * v175) * l_sin_0((v175 * v178 - v184) * 2 * l_pi_0 / v182) + v177 + v176;
            end;
        end;
    end;
    local function v196(v186, v187, v188, v189, v190, v191)
        -- upvalues: v163 (ref), l_pow_0 (ref), l_sin_0 (ref), l_pi_0 (ref)
        local v192 = nil;
        if v186 == 0 then
            return v187;
        else
            v186 = v186 / v189 * 2;
            if v186 == 2 then
                return v187 + v188;
            else
                local v193, v194, v195 = v163(v191, v190, v188, v189);
                v192 = v195;
                v190 = v194;
                v191 = v193;
                v186 = v186 - 1;
                if v186 < 0 then
                    return -0.5 * v190 * l_pow_0(2, 10 * v186) * l_sin_0((v186 * v189 - v192) * 2 * l_pi_0 / v191) + v187;
                else
                    return v190 * l_pow_0(2, -10 * v186) * l_sin_0((v186 * v189 - v192) * 2 * l_pi_0 / v191) * 0.5 + v188 + v187;
                end;
            end;
        end;
    end;
    local function v203(v197, v198, v199, v200, v201, v202)
        -- upvalues: v185 (ref), v174 (ref)
        if v197 < v200 / 2 then
            return v185(v197 * 2, v198, v199 / 2, v200, v201, v202);
        else
            return v174(v197 * 2 - v200, v198 + v199 / 2, v199 / 2, v200, v201, v202);
        end;
    end;
    local function v209(v204, v205, v206, v207, v208)
        if not v208 then
            v208 = 1.70158;
        end;
        v204 = v204 / v207;
        return v206 * v204 * v204 * ((v208 + 1) * v204 - v208) + v205;
    end;
    local function v215(v210, v211, v212, v213, v214)
        if not v214 then
            v214 = 1.70158;
        end;
        v210 = v210 / v213 - 1;
        return v212 * (v210 * v210 * ((v214 + 1) * v210 + v214) + 1) + v211;
    end;
    local function v221(v216, v217, v218, v219, v220)
        v220 = (v220 or 1.70158) * 1.525;
        v216 = v216 / v219 * 2;
        if v216 < 1 then
            return v218 / 2 * v216 * v216 * ((v220 + 1) * v216 - v220) + v217;
        else
            v216 = v216 - 2;
            return v218 / 2 * (v216 * v216 * ((v220 + 1) * v216 + v220) + 2) + v217;
        end;
    end;
    local function v227(v222, v223, v224, v225, v226)
        -- upvalues: v215 (ref), v209 (ref)
        if v222 < v225 / 2 then
            return v215(v222 * 2, v223, v224 / 2, v225, v226);
        else
            return v209(v222 * 2 - v225, v223 + v224 / 2, v224 / 2, v225, v226);
        end;
    end;
    local function v232(v228, v229, v230, v231)
        v228 = v228 / v231;
        if v228 < 0.36363636363636365 then
            return v230 * 7.5625 * v228 * v228 + v229;
        elseif v228 < 0.7272727272727273 then
            v228 = v228 - 0.5454545454545454;
            return v230 * (7.5625 * v228 * v228 + 0.75) + v229;
        elseif v228 < 0.9090909090909091 then
            v228 = v228 - 0.8181818181818182;
            return v230 * (7.5625 * v228 * v228 + 0.9375) + v229;
        else
            v228 = v228 - 0.9545454545454546;
            return v230 * (7.5625 * v228 * v228 + 0.984375) + v229;
        end;
    end;
    local function v237(v233, v234, v235, v236)
        -- upvalues: v232 (ref)
        return v235 - v232(v236 - v233, 0, v235, v236) + v234;
    end;
    local function v242(v238, v239, v240, v241)
        -- upvalues: v237 (ref), v232 (ref)
        if v238 < v241 / 2 then
            return v237(v238 * 2, 0, v240, v241) * 0.5 + v239;
        else
            return v232(v238 * 2 - v241, 0, v240, v241) * 0.5 + v240 * 0.5 + v239;
        end;
    end;
    local function v247(v243, v244, v245, v246)
        -- upvalues: v232 (ref), v237 (ref)
        if v243 < v246 / 2 then
            return v232(v243 * 2, v244, v245 / 2, v246);
        else
            return v237(v243 * 2 - v246, v244 + v245 / 2, v245 / 2, v246);
        end;
    end;
    v5.easing = {
        linear = v17, 
        inQuad = v22, 
        outQuad = v27, 
        inOutQuad = v32, 
        outInQuad = v37, 
        inCubic = v42, 
        outCubic = v47, 
        inOutCubic = v52, 
        outInCubic = v57, 
        inQuart = v62, 
        outQuart = v67, 
        inOutQuart = v72, 
        outInQuart = v77, 
        inQuint = v82, 
        outQuint = v87, 
        inOutQuint = v92, 
        outInQuint = v97, 
        inSine = v102, 
        outSine = v107, 
        inOutSine = v112, 
        outInSine = v117, 
        inExpo = v122, 
        outExpo = v127, 
        inOutExpo = v132, 
        outInExpo = v137, 
        inCirc = v142, 
        outCirc = v147, 
        inOutCirc = v152, 
        outInCirc = v157, 
        inElastic = v174, 
        outElastic = v185, 
        inOutElastic = v196, 
        outInElastic = v203, 
        inBack = v209, 
        outBack = v215, 
        inOutBack = v221, 
        outInBack = v227, 
        inBounce = v237, 
        outBounce = v232, 
        inOutBounce = v242, 
        outInBounce = v247
    };
    local function v248(v249, v250, v251)
        -- upvalues: v248 (ref)
        if not v251 then
            v251 = v250;
        end;
        local v252 = getmetatable(v250);
        if v252 and getmetatable(v249) == nil then
            setmetatable(v249, v252);
        end;
        for v253, v254 in pairs(v250) do
            if type(v254) == "table" then
                v249[v253] = v248({}, v254, v251[v253]);
            else
                v249[v253] = v251[v253];
            end;
        end;
        return v249;
    end;
    local function v255(v256, v257, v258)
        -- upvalues: v248 (ref), v255 (ref)
        if not v258 then
            v258 = {};
        end;
        local v259 = nil;
        local v260 = nil;
        for v261, v262 in pairs(v257) do
            local v263 = type(v262);
            v260 = v248({}, v258);
            v259 = v263;
            table.insert(v260, tostring(v261));
            if v259 == "number" then
                assert(type(v256[v261]) == "number", "Parameter '" .. table.concat(v260, "/") .. "' is missing from subject or isn't a number");
            elseif v259 == "table" then
                v255(v256[v261], v262, v260);
            else
                assert(v259 == "number", "Parameter '" .. table.concat(v260, "/") .. "' must be a number or table of numbers");
            end;
        end;
    end;
    local function v269(v264, v265, v266, v267)
        -- upvalues: v255 (ref)
        assert(type(v264) == "number" and v264 > 0, "duration must be a positive number. Was " .. tostring(v264));
        local v268 = type(v265);
        assert(v268 == "table" or v268 == "userdata", "subject must be a table or userdata. Was " .. tostring(v265));
        assert(type(v266) == "table", "target must be a table. Was " .. tostring(v266));
        assert(type(v267) == "function", "easing must be a function. Was " .. tostring(v267));
        v255(v265, v266);
    end;
    local function v272(v270)
        -- upvalues: v5 (ref)
        if not v270 then
            v270 = "linear";
        end;
        if type(v270) == "string" then
            local l_v270_0 = v270;
            v270 = v5.easing[l_v270_0];
            if type(v270) ~= "function" then
                error("The easing function name '" .. l_v270_0 .. "' is invalid");
            end;
        end;
        return v270;
    end;
    local function v273(v274, v275, v276, v277, v278, v279)
        -- upvalues: v273 (ref)
        local _ = nil;
        local _ = nil;
        local _ = nil;
        local _ = nil;
        for v284, v285 in pairs(v275) do
            if type(v285) == "table" then
                v273(v274[v284], v285, v276[v284], v277, v278, v279);
            else
                v274[v284] = v279(v277, v276[v284], v285 - v276[v284], v278);
            end;
        end;
    end;
    local v286 = {};
    local v287 = {
        __index = v286
    };
    v286.set = function(v288, v289)
        -- upvalues: v248 (ref), v273 (ref)
        assert(type(v289) == "number", "clock must be a positive number or 0");
        v288.initial = v288.initial or v248({}, v288.target, v288.subject);
        v288.clock = v289;
        if v288.clock <= 0 then
            v288.clock = 0;
            v248(v288.subject, v288.initial);
        elseif v288.clock >= v288.duration then
            v288.clock = v288.duration;
            v248(v288.subject, v288.target);
        else
            v273(v288.subject, v288.target, v288.initial, v288.clock, v288.duration, v288.easing);
        end;
        return v288.clock >= v288.duration;
    end;
    v286.reset = function(v290)
        return v290:set(0);
    end;
    v286.update = function(v291, v292)
        assert(type(v292) == "number", "dt must be a number");
        return v291:set(v291.clock + v292);
    end;
    v5.new = function(v293, v294, v295, v296)
        -- upvalues: v272 (ref), v269 (ref), v287 (ref)
        v296 = v272(v296);
        v269(v293, v294, v295, v296);
        return setmetatable({
            clock = 0, 
            duration = v293, 
            subject = v294, 
            target = v295, 
            easing = v296
        }, v287);
    end;
    return v5;
end)();
breathe = function(v298, v299)
    local v300 = globals.realtime * (v299 or 1) % math.pi;
    local v301 = math.sin(v300 + (v298 or 0));
    return (math.abs(v301));
end;
local v302 = {
    fs = 0, 
    dmg = 0, 
    fd = 0, 
    hs = 0, 
    dt = 0, 
    alpha = 0, 
    custom_scope_offset = 0, 
    scope_alpha = 0, 
    scope_offset = 0
};
local v303 = {};
local v304 = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg");
local v305 = render.load_font("Calibri", 23, "bda");
local v306 = render.load_font("Calibri", 11, "bda");
local v307 = {};
math.lerp = function(v308, v309, v310)
    return v308 + (v309 - v308) * globals.frametime * v310;
end;
ascii_to_hex = function(v311)
    local v312 = "";
    for v313 = 1, #v311 do
        local v314 = string.byte(v311, v313);
        v312 = v312 .. string.format("%02X", v314);
    end;
    return v312;
end;
local function v316()
    -- upvalues: l_base64_0 (ref)
    local v315 = {
        lua = "genesis_beta", 
        username = common.get_username()
    };
    return ascii_to_hex(l_base64_0.encode(json.stringify(v315)));
end;
local v317 = db.genesis_pidor or {
    [1] = 0, 
    [2] = 0, 
    [3] = 0
};
local v318 = common.get_unixtime();
local function v323(v319)
    local v320 = math.floor(v319 / 3600);
    local v321 = math.floor((v319 - v320 * 3600) / 60);
    local v322 = math.floor(v319 - v320 * 3600 - v321 * 60);
    return string.format("%02d:%02d:%02d", v320, v321, v322);
end;
local v324 = {
    aa_enable = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    yawbase = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yawoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    avoidbackstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    yawmodifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    yawmodoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    leftlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    rightlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    bodyfrees = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    disableyawmod = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    bodyfreestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    extendedangles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
    extendedpitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
    extendedroll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"), 
    fakelag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
    fakelaglimit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
    fakelagvariab = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"), 
    fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    legmovement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    scopeoverlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"), 
    lagoptions = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    hsoptions = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
};
local v325 = {
    main = l_pui_0.create("\b969696FF\b666666FF[G E N E S I S]", "\n", 1), 
    info = l_pui_0.create("\b969696FF\b666666FF[G E N E S I S]", "\n\n", 1), 
    config = l_pui_0.create("\b969696FF\b666666FF[G E N E S I S]", "\n\n\n", 2), 
    picture = l_pui_0.create("\b969696FF\b666666FF[G E N E S I S]", "\n\n\n\n", 2), 
    selector = l_pui_0.create("REBORN \v\f<heart>", "\n", 1), 
    other_selector = l_pui_0.create("REBORN \v\f<heart>", "\n\n", 2), 
    antiaim = l_pui_0.create("REBORN \v\f<heart>", "\n\n\n", 1), 
    team = l_pui_0.create("REBORN \v\f<heart>", "\n\n\n\n\n\n\n\n\n", 2), 
    builder = l_pui_0.create("REBORN \v\f<heart>", "\n\n\n\n", 2), 
    visuals = l_pui_0.create("REBORN \v\f<heart>", "\n\n\n\n\n", 2), 
    interface = l_pui_0.create("REBORN \v\f<heart>", "\n\n\n\n\n\n", 1), 
    misc = l_pui_0.create("REBORN \v\f<heart>", "\n\n\n\n\n\n\n", 1), 
    other = l_pui_0.create("REBORN \v\f<heart>", "\n\n\n\n\n\n\n\n", 2)
};
local v326 = {
    main = {}, 
    antiaim = {}, 
    builder = {}, 
    builder_t = {}, 
    visuals = {}, 
    misc = {}
};
v325.main:button("                         \v\f<discord>\r  Discord Server                         ", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/");
end, true):tooltip("This button will open you the discord server of this script");
v325.main:button("                \v\f<crosshairs>\r  Neverlose Configuration              ", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://ru.neverlose.cc/market/");
end, true):tooltip("This button will open the configuration page on the market");
v325.main:button("               \v\f<discord>\r  Author -> blameless1337             ", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discordapp.com/users/");
end, true):tooltip("This button will open the authors discord profile");
v326.main.tab = v325.selector:list("", {
    [1] = "\v\f<user-helmet-safety>\r    Anti-Aim", 
    [2] = "\v\f<sliders>\r    Other"
});
v326.misc.selector = v325.other_selector:list("", {
    [1] = "\v\f<palette>\r    Visuals", 
    [2] = "\v\f<gears>\r    Misc"
}):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
});
v325.info:label("\v\f<user>\r   User: ");
v325.info:button("\v" .. common.get_username(), function()

end, true);
v325.info:label("\v\f<code-branch>\r   Version: ");
v325.info:button("\v2.0", function()

end, true);
v325.info:label("\v\f<code-compare>\r   Stay With US: ");
v325.info:button("\vG E N E S I S", function()

end, true);
v326.generate_key = v325.config:button("                       \v\f<discord>\r  Discord Verify Key                 ", function()
    -- upvalues: v316 (ref), l_clipboard_0 (ref)
    local v327 = v316();
    print(v327);
    l_clipboard_0.set(v327);
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/");
end, true);
v326.import = v325.config:button("   \v\f<download>\r  Import Config  ", function()

end, true);
v326.export = v325.config:button("   \v\f<share-nodes>\r  Export Config  ", function()

end, true);
v326.default = v325.config:button("                        \v\f<check>\r  Default Config                         ", function()

end, true);
local v328 = v323(v317[3]);
v325.picture:label("\v\f<clock>\r   Time Played: ");
v325.picture:button(" \v" .. v328 .. " ", function()

end, true);
v325.picture:label("\v\f<shield>\r   Missed shots at \vyou: ");
v325.picture:button(" \v" .. v317[2] .. " ", function()

end, true);
v325.picture:label("\v\f<skull>\r   Enemies \veliminated: ");
v325.picture:button(" \v" .. v317[1] .. " ", function()

end, true);
v326.misc.clantag = v325.misc:switch("\v\f<tag>\r   Clantag"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.misc.selector
});
v326.misc.trashtalk = v325.misc:switch("\v\f<comment>\r   Trashtalk"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.misc.selector
});
v326.misc.edge_stop = v325.misc:switch("\v\f<block-brick>\r   Edge Stop"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.misc.selector
});
v326.misc.fastladder = v325.misc:switch("\v\f<water-ladder>\r   Fast Ladder"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.misc.selector
});
v326.misc.aspectratio = v325.misc:switch("\v\f<eye>\r   Aspect Ratio"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.misc.selector
});
v326.misc.aspectratio_create = v326.misc.aspectratio:create();
v326.misc.aspectratio_amount = v326.misc.aspectratio_create:slider("Amount", 0, 200, 0, 1, function(v329)
    local _ = 0;
    return v329 == 125 and "5:4" or v329 == 133 and "4:3" or v329 == 150 and "3:2" or v329 == 160 and "16:10" or v329 == 180 and "16:9" or v329;
end):depend(v326.misc.aspectratio);
v326.misc.aspectratio_create:button("  \v5:4  ", function()
    -- upvalues: v326 (ref)
    v326.misc.aspectratio_amount:set(125);
end, true):depend(v326.misc.aspectratio);
v326.misc.aspectratio_create:button("  \v4:3  ", function()
    -- upvalues: v326 (ref)
    v326.misc.aspectratio_amount:set(133);
end, true):depend(v326.misc.aspectratio);
v326.misc.aspectratio_create:button("  \v3:2  ", function()
    -- upvalues: v326 (ref)
    v326.misc.aspectratio_amount:set(150);
end, true):depend(v326.misc.aspectratio);
v326.misc.aspectratio_create:button("  \v16:10  ", function()
    -- upvalues: v326 (ref)
    v326.misc.aspectratio_amount:set(160);
end, true):depend(v326.misc.aspectratio);
v326.misc.aspectratio_create:button("  \v16:9  ", function()
    -- upvalues: v326 (ref)
    v326.misc.aspectratio_amount:set(180);
end, true):depend(v326.misc.aspectratio);
v326.misc.rage_logs = v325.misc:switch("\v\f<gun>\r   Ragebot Logs"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.misc.selector
});
v326.misc.rage_logs_create = v326.misc.rage_logs:create();
v326.misc.rage_logs_type = v326.misc.rage_logs_create:listable("", {
    [1] = "Console", 
    [2] = "Event", 
    [3] = "Screen"
}):depend(v326.misc.rage_logs);
v326.misc.rage_logs_style = v326.misc.rage_logs_create:list("", {
    [1] = "Default", 
    [2] = "Modern"
}):depend(v326.misc.rage_logs, {
    [1] = nil, 
    [2] = 3, 
    [1] = v326.misc.rage_logs_type
});
v326.misc.rage_logs_round = v326.misc.rage_logs_create:slider("Rounding", 0, 10, 3):depend(v326.misc.rage_logs, {
    [1] = nil, 
    [2] = 3, 
    [1] = v326.misc.rage_logs_type
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.misc.rage_logs_style
});
v326.misc.rage_logs_hit = v326.misc.rage_logs_create:color_picker("Hit Color", color(186, 196, 249)):depend(v326.misc.rage_logs, {
    [1] = nil, 
    [2] = 3, 
    [1] = v326.misc.rage_logs_type
}, {
    [1] = v326.misc.rage_logs_style, 
    [2] = function()
        -- upvalues: v326 (ref)
        return v326.misc.rage_logs_style:get() ~= 3;
    end
});
v326.misc.rage_logs_miss = v326.misc.rage_logs_create:color_picker("Miss Color", color(186, 90, 90)):depend(v326.misc.rage_logs, {
    [1] = nil, 
    [2] = 3, 
    [1] = v326.misc.rage_logs_type
}, {
    [1] = v326.misc.rage_logs_style, 
    [2] = function()
        -- upvalues: v326 (ref)
        return v326.misc.rage_logs_style:get() ~= 3;
    end
});
v326.misc.auto_teleport = v325.misc:switch("\v\f<transporter>\r   Auto Teleport"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.misc.selector
});
v326.misc.no_fall_damage = v325.other:switch("\v\f<person-falling>\r   No Fall Damage"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.misc.selector
});
v326.misc.dormant_aimbot = v325.other:switch("\v\f<eye-slash>\r   Dormant Aimbot"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.misc.selector
});
v326.misc.fakeping = v325.other:switch("\v\f<wifi>\r   Unlock Fake Ping"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.misc.selector
});
v326.misc.fakeping_create = v326.misc.fakeping:create();
v326.misc.fakeping_amount = v326.misc.fakeping_create:slider("Amount", 0, 200, 130):depend(v326.misc.fakeping);
v326.misc.hitchance = v325.other:switch("\v\f<location-crosshairs-slash>\r   Custom Hitchance"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.misc.selector
});
v326.misc.hitchance_create = v326.misc.hitchance:create();
v326.misc.hitchance_air = v326.misc.hitchance_create:selectable("In Air Hitchance", {
    [1] = "Scout", 
    [2] = "R8", 
    [3] = "Shotgun", 
    [4] = "SMG"
}):depend(v326.misc.hitchance);
v326.misc.hitchance_scope = v326.misc.hitchance_create:selectable("No Scope Hitchance", {
    [1] = "AWP", 
    [2] = "Auto", 
    [3] = "Scout"
}):depend(v326.misc.hitchance);
v326.misc.hitchance_air_scout = v326.misc.hitchance_create:slider("[AIR] Scout", 0, 100, 40):depend(v326.misc.hitchance, {
    [1] = nil, 
    [2] = "Scout", 
    [1] = v326.misc.hitchance_air
});
v326.misc.hitchance_air_r8 = v326.misc.hitchance_create:slider("[AIR] R8", 0, 100, 40):depend(v326.misc.hitchance, {
    [1] = nil, 
    [2] = "R8", 
    [1] = v326.misc.hitchance_air
});
v326.misc.hitchance_air_shotgun = v326.misc.hitchance_create:slider("[AIR] Shotgun", 0, 100, 40):depend(v326.misc.hitchance, {
    [1] = nil, 
    [2] = "Shotgun", 
    [1] = v326.misc.hitchance_air
});
v326.misc.hitchance_air_smg = v326.misc.hitchance_create:slider("[AIR] SMG", 0, 100, 40):depend(v326.misc.hitchance, {
    [1] = nil, 
    [2] = "SMG", 
    [1] = v326.misc.hitchance_air
});
v326.misc.hitchance_scope_awp = v326.misc.hitchance_create:slider("[NO SCOPE] AWP", 0, 100, 40):depend(v326.misc.hitchance, {
    [1] = nil, 
    [2] = "AWP", 
    [1] = v326.misc.hitchance_scope
});
v326.misc.hitchance_scope_auto = v326.misc.hitchance_create:slider("[NO SCOPE] Auto", 0, 100, 40):depend(v326.misc.hitchance, {
    [1] = nil, 
    [2] = "Auto", 
    [1] = v326.misc.hitchance_scope
});
v326.misc.hitchance_scope_scout = v326.misc.hitchance_create:slider("[NO SCOPE] Scout", 0, 100, 40):depend(v326.misc.hitchance, {
    [1] = nil, 
    [2] = "Scout", 
    [1] = v326.misc.hitchance_scope
});
v326.misc.viewmodel = v325.other:switch("\v\f<hands-praying>\r   Viewmodel Changer"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.misc.selector
});
v326.misc.viewmodel_create = v326.misc.viewmodel:create();
v326.misc.viewmodel_fov = v326.misc.viewmodel_create:slider("Fov", -100, 100, 68):depend(v326.misc.viewmodel);
v326.misc.viewmodel_x = v326.misc.viewmodel_create:slider("X", -10, 10, 3):depend(v326.misc.viewmodel);
v326.misc.viewmodel_y = v326.misc.viewmodel_create:slider("Y", -10, 10, 0):depend(v326.misc.viewmodel);
v326.misc.viewmodel_z = v326.misc.viewmodel_create:slider("Z", -10, 10, -2):depend(v326.misc.viewmodel);
v326.misc.viewmodel_create:button("                        \vReset \rViewmodel                       ", function()
    -- upvalues: v326 (ref)
    v326.misc.viewmodel_fov:set(68);
    v326.misc.viewmodel_x:set(2.5);
    v326.misc.viewmodel_y:set(0);
    v326.misc.viewmodel_z:set(-1.5);
end, true):depend(v326.misc.viewmodel);
v326.misc.auto_hs = v325.other:switch("\v\f<shield>\r   Automatic Hide Shots"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.misc.selector
});
v326.misc.auto_hs:tooltip("Automatically turns off the double tap, and turns on the hide shots in the crouch. Working only on scout, awp");
v326.misc.auto_grenade = v325.other:switch("\v\f<bomb>\r   Auto Grenade Release"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.misc.selector
});
v326.misc.auto_grenade_create = v326.misc.auto_grenade:create();
v326.misc.auto_grenade_he = v326.misc.auto_grenade_create:slider("HE Damage", 0, 50, 20):depend(v326.misc.auto_grenade);
v326.misc.auto_grenade_molotov = v326.misc.auto_grenade_create:slider("Molotov Radius", 10, 200, 100):depend(v326.misc.auto_grenade);
v326.visuals.solus_ui = v325.interface:switch("\v\f<window>\r   Solus UI"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.misc.selector
});
v326.visuals.solus_ui_create = v326.visuals.solus_ui:create();
v326.visuals.solus_ui_type = v326.visuals.solus_ui_create:list("", {
    [1] = "V1", 
    [2] = "V2", 
    [3] = "V3", 
    [4] = "Modern"
}):depend(v326.visuals.solus_ui);
v326.visuals.solus_ui_round = v326.visuals.solus_ui_create:slider("Rounding", 0, 10, 3):depend(v326.visuals.solus_ui, {
    [1] = nil, 
    [2] = "Modern", 
    [1] = v326.visuals.solus_ui_type
});
v326.visuals.solus_ui_list = v326.visuals.solus_ui_create:listable("", {
    [1] = "Watermark", 
    [2] = "Keybinds", 
    [3] = "Spectators", 
    [4] = "Bomb Info"
}):depend(v326.visuals.solus_ui);
v326.visuals.solus_ui_name = v326.visuals.solus_ui_create:input("Username", common.get_username()):depend(v326.visuals.solus_ui, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.visuals.solus_ui_list
});
v326.visuals.solus_ui_color = v326.visuals.solus_ui_create:color_picker("Accent", color(186, 196, 249)):depend(v326.visuals.solus_ui);
v326.visuals.windows = v325.interface:switch("\v\f<slider>\r   Windows"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.misc.selector
});
v326.visuals.windows_create = v326.visuals.windows:create();
v326.visuals.windows_select = v326.visuals.windows_create:listable("", {
    [1] = "Velocity", 
    [2] = "Defensive"
}):depend(v326.visuals.windows);
v326.visuals.windows_slowed = v326.visuals.windows_create:combo("Velocity Style", {
    [1] = "Default", 
    [2] = "Modern", 
    [3] = "Newest"
}):depend(v326.visuals.windows, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.visuals.windows_select
});
v326.visuals.windows_slowed_clr = v326.visuals.windows_create:color_picker("Velocity Color", color(220)):depend(v326.visuals.windows, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.visuals.windows_select
});
v326.visuals.windows_defensive = v326.visuals.windows_create:combo("Defensive Style", {
    [1] = "Default", 
    [2] = "Modern", 
    [3] = "Newest"
}):depend(v326.visuals.windows, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.visuals.windows_select
});
v326.visuals.windows_defensive_clr = v326.visuals.windows_create:color_picker("Defensive Color", color(220)):depend(v326.visuals.windows, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.visuals.windows_select
});
v326.visuals.gs_features = v325.interface:switch("\v\f<message-text>\r   G\a9AAF36FFS\r Features"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.misc.selector
});
v326.visuals.gs_features_create = v326.visuals.gs_features:create();
v326.visuals.gs_indicators = v326.visuals.gs_features_create:switch("Indicators"):depend(v326.visuals.gs_features, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.misc.selector
});
v326.visuals.gs_spectators = v326.visuals.gs_features_create:switch("Spectators"):depend(v326.visuals.gs_features, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.misc.selector
});
v326.visuals.gs_trans = v326.visuals.gs_features_create:switch("Keep Model Transparency"):depend(v326.visuals.gs_features, {
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.misc.selector
});
v326.visuals.custom_scope = v325.interface:switch("\v\f<crosshairs>\r   Custom Scope"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.misc.selector
});
v326.visuals.custom_scope_create = v326.visuals.custom_scope:create();
v326.visuals.custom_scope_t = v326.visuals.custom_scope_create:switch("T Scope"):depend(v326.visuals.custom_scope);
v326.visuals.custom_scope_inverted = v326.visuals.custom_scope_create:switch("Inverted"):depend(v326.visuals.custom_scope);
v326.visuals.custom_scope_length = v326.visuals.custom_scope_create:slider("Length", 10, 250, 50):depend(v326.visuals.custom_scope);
v326.visuals.custom_scope_offset = v326.visuals.custom_scope_create:slider("Offset", 1, 50, 10):depend(v326.visuals.custom_scope);
v326.visuals.custom_scope_anim = v326.visuals.custom_scope_create:slider("Animation", 1, 20, 10):depend(v326.visuals.custom_scope);
v326.visuals.custom_scope_color = v326.visuals.custom_scope_create:color_picker("Color"):depend(v326.visuals.custom_scope);
v326.visuals.world_hitmarker = v325.visuals:switch("\v\f<earth-africa>\r   World Hitmarker"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.misc.selector
});
v326.visuals.world_hitmarker_clr = v326.visuals.world_hitmarker:color_picker("Color", color(88, 255, 209, 255)):depend(v326.visuals.world_hitmarker);
v326.visuals.world_missmarker = v325.visuals:switch("\v\f<bomb>\r   World Missmarker"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.misc.selector
});
v326.visuals.world_missmarker_clr = v326.visuals.world_missmarker:color_picker("Color", color(255, 0, 0)):depend(v326.visuals.world_missmarker);
v326.visuals.crosshair_ind = v325.visuals:switch("\v\f<display>\r   Crosshair Indicators"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.misc.selector
});
v326.visuals.crosshair_ind_create = v326.visuals.crosshair_ind:create();
v326.visuals.crosshair_ind_color1 = v326.visuals.crosshair_ind_create:color_picker("Color 1", color(255, 100, 100)):depend(v326.visuals.crosshair_ind);
v326.visuals.crosshair_ind_color2 = v326.visuals.crosshair_ind_create:color_picker("Color 2", color(200)):depend(v326.visuals.crosshair_ind);
v326.visuals.damage_indicator = v325.visuals:switch("\v\f<gun>\r   Min. Damage Indicator"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.misc.selector
});
v326.visuals.damage_indicator_create = v326.visuals.damage_indicator:create();
v326.visuals.damage_indicator_font = v326.visuals.damage_indicator_create:combo("Font", {
    [1] = "Default", 
    [2] = "Small", 
    [3] = "Bold", 
    [4] = "Console"
}):depend(v326.visuals.damage_indicator);
v326.antiaim.pitch = v325.antiaim:combo("\v\f<user>\r   Pitch", v324.pitch:list()):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.yaw = v325.antiaim:combo("\v\f<right-left>\r   Yaw Base", {
    [1] = "Local View", 
    [2] = "At Target", 
    [3] = "Left", 
    [4] = "Right", 
    [5] = "Forward"
}):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.yaw_create = v326.antiaim.yaw:create();
v326.antiaim.yaw_static = v326.antiaim.yaw_create:switch("Static On Manual Yaw"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.yaw_flick = v326.antiaim.yaw_create:switch("Defensive Flick On Manual Yaw"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.yaw_hit = v326.antiaim.yaw_create:switch("Hittable Check"):depend(v326.antiaim.yaw_flick, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.yaw_pitch = v326.antiaim.yaw_create:slider("Pitch Offset", -89, 89, 0):depend(v326.antiaim.yaw_flick, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.additions = v325.antiaim:selectable("\v\f<calculator-simple>\r   Additions", {
    [1] = "Safe Head", 
    [2] = "Warmup Anti-Aim", 
    [3] = "Avoid Backstab"
}):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.additions_create = v326.antiaim.additions:create();
v326.antiaim.safe_head = v326.antiaim.additions_create:selectable("\v\f<caret-right>\r   Safe Head", {
    [1] = "Air~C Knife", 
    [2] = "Air~C Taser", 
    [3] = "Height Difference"
}):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = "Safe Head", 
    [1] = v326.antiaim.additions
});
v326.antiaim.safe_head_difference = v326.antiaim.additions_create:slider("Difference", 0, 200, 50, 1, "%"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = "Safe Head", 
    [1] = v326.antiaim.additions
}, {
    [1] = nil, 
    [2] = "Height Difference", 
    [1] = v326.antiaim.safe_head
});
v326.antiaim.freestanding = v325.antiaim:switch("\v\f<arrows-up-down-left-right>\r   Freestanding"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.freestanding_create = v326.antiaim.freestanding:create();
v326.antiaim.freestanding_flick = v326.antiaim.freestanding_create:switch("Defensive Flick"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.freestanding_hit = v326.antiaim.freestanding_create:switch("Hittable Check"):depend(v326.antiaim.freestanding_flick, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.freestanding_pitch = v326.antiaim.freestanding_create:slider("Pitch Offset", -89, 89, 0):depend(v326.antiaim.freestanding_flick, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.freestanding_bodyfreestanding = v326.antiaim.freestanding_create:switch("Body Freestanding"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.freestanding_disableyawmod = v326.antiaim.freestanding_create:switch("Disable Yaw Modifiers"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.anim_breakers = v325.antiaim:switch("\v\f<boot>\r   Anim. Breakers"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.anim_breakers_create = v326.antiaim.anim_breakers:create();
v326.antiaim.anim_ground = v326.antiaim.anim_breakers_create:combo("On Ground", {
    [1] = "Disabled", 
    [2] = "Static", 
    [3] = "Sliding", 
    [4] = "Moonwalk", 
    [5] = "Jitter", 
    [6] = "Better Jitter"
}):depend(v326.antiaim.anim_breakers, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.anim_jitter = v326.antiaim.anim_breakers_create:slider("Jitter", 0, 100, 80):depend(v326.antiaim.anim_breakers, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
}, {
    [1] = v326.antiaim.anim_ground, 
    [2] = function()
        -- upvalues: v326 (ref)
        return v326.antiaim.anim_ground:get() == "Jitter" or v326.antiaim.anim_ground:get() == "Better Jitter";
    end
});
v326.antiaim.anim_air = v326.antiaim.anim_breakers_create:combo("In Air", {
    [1] = "Disabled", 
    [2] = "Static", 
    [3] = "Flying", 
    [4] = "Moonwalk", 
    [5] = "Jitter", 
    [6] = "Better Jitter"
}):depend(v326.antiaim.anim_breakers, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.anim_air_jitter = v326.antiaim.anim_breakers_create:slider("In Air Jitter", 0, 100, 80):depend(v326.antiaim.anim_breakers, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
}, {
    [1] = v326.antiaim.anim_air, 
    [2] = function()
        -- upvalues: v326 (ref)
        return v326.antiaim.anim_air:get() == "Jitter" or v326.antiaim.anim_air:get() == "Better Jitter";
    end
});
v326.antiaim.anim_other = v326.antiaim.anim_breakers_create:selectable("Other", {
    [1] = "Zero Pitch On Land", 
    [2] = "Move Lean", 
    [3] = "EarthQuake", 
    [4] = "Static"
}):depend(v326.antiaim.anim_breakers, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.anim_lean = v326.antiaim.anim_breakers_create:slider("Move Lean", 0, 100, 100):depend(v326.antiaim.anim_breakers, {
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
}, {
    [1] = nil, 
    [2] = "Move Lean", 
    [1] = v326.antiaim.anim_other
});
v326.antiaim.config_manager = v325.antiaim:label("\v\f<rectangle-list>\r   Config Manager"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.config_manager_create = v326.antiaim.config_manager:create();
v326.antiaim.cond = {
    [1] = "General", 
    [2] = "Standing", 
    [3] = "Moving", 
    [4] = "Walking", 
    [5] = "Crouching", 
    [6] = "Snaking", 
    [7] = "In Air", 
    [8] = "In Air~C", 
    [9] = "Discharged", 
    [10] = "Direction"
};
v326.antiaim.short_cond = {
    [1] = "\vG\r \194\183 ", 
    [2] = "\vS\r \194\183 ", 
    [3] = "\vM\r \194\183 ", 
    [4] = "\vW\r \194\183 ", 
    [5] = "\vC\r \194\183 ", 
    [6] = "\vS\r \194\183 ", 
    [7] = "\vA\r \194\183 ", 
    [8] = "\vA~C\r \194\183 ", 
    [9] = "\vD\r \194\183 ", 
    [10] = "\vDR\r \194\183 "
};
v326.antiaim.team = v325.team:list("\n", {
    [1] = "\v\f<shield>\r  CT", 
    [2] = "\v\f<gun>\r  T"
}):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
local function v332(v331)
    -- upvalues: v326 (ref)
    if v331:get() == 1 then
        v326.antiaim.condname = "\v\f<shield>\r  ";
    else
        v326.antiaim.condname = "\v\f<gun>\r  ";
    end;
end;
v332(v326.antiaim.team);
v326.antiaim.conditions = v325.builder:combo(v326.antiaim.condname .. " State", v326.antiaim.cond):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v326.main.tab
});
v326.antiaim.team:set_callback(function(v333)
    -- upvalues: v332 (ref), v326 (ref)
    v332(v333);
    v326.antiaim.conditions:name(v326.antiaim.condname .. " State");
end);
for v334 = 1, #v326.antiaim.cond do
    v326.builder[v334] = {};
    v326.builder[v334].enable = v325.builder:switch("\v" .. "\f<square-check>\r  Override \v" .. v326.antiaim.cond[v334] .. "\r State");
    v326.builder[v334].yaw_left = v325.builder:slider("\v\f<left-from-line>\r  Yaw Left", -180, 180, 0, 1, "\194\176");
    v326.builder[v334].yaw_right = v325.builder:slider("\v\f<right-from-line>\r  Yaw Right", -180, 180, 0, 1, "\194\176");
    v326.builder[v334].yaw_random = v325.builder:slider("\v\f<dice-five>\r  Yaw Random", 0, 100, 0, 1, "%");
    v326.builder[v334].yawmodifier = v325.builder:combo("\v\f<arrows-left-right-to-line>\r  Modifier", v324.yawmodifier:list());
    v326.builder[v334].yawmodifier_create = v326.builder[v334].yawmodifier:create();
    v326.builder[v334].yawmodifier_offset = v326.builder[v334].yawmodifier_create:slider("Offset", -180, 180, 0);
    v326.builder[v334].yawmodifier_random = v326.builder[v334].yawmodifier_create:slider("Random", 0, 100, 0);
    v326.builder[v334].bodyyaw = v325.builder:switch("\v\f<angle>\r  Body Yaw");
    v326.builder[v334].bodyyaw_create = v326.builder[v334].bodyyaw:create();
    v326.builder[v334].invert = v326.builder[v334].bodyyaw_create:switch("Inverter");
    v326.builder[v334].leftlimit = v326.builder[v334].bodyyaw_create:slider("Left Limit", 0, 60, 60);
    v326.builder[v334].rightlimit = v326.builder[v334].bodyyaw_create:slider("Right Limit", 0, 60, 60);
    v326.builder[v334].options = v326.builder[v334].bodyyaw_create:selectable("Options", v324.options:list());
    v326.builder[v334].delay = v326.builder[v334].bodyyaw_create:slider("Jitter Speed", 1, 10, 1, 1, function(v335)
        return v335 == 1 and "NL" or v335;
    end);
    v326.builder[v334].bodyfreestanding = v326.builder[v334].bodyyaw_create:combo("Freestanding", v324.bodyfrees:list());
    v326.builder[v334].defensive_type = v325.builder:selectable("\v\f<explosion>\r  Break \aD8DB68FFLC", {
        [1] = "DT", 
        [2] = "Hide Shots"
    });
    v326.builder[v334].defensive_type_create = v326.builder[v334].defensive_type:create();
    v326.builder[v334].defensive_type_type = v326.builder[v334].defensive_type_create:list("\n", {
        [1] = "Default", 
        [2] = "Switch", 
        [3] = "Always"
    });
    v326.builder[v334].defensive = v325.builder:switch("\v\f<arrows-spin>\r  Defensive Snap");
    v326.builder[v334].defensive_create = v326.builder[v334].defensive:create();
    v326.builder[v334].defensive_clear = v326.builder[v334].defensive_create:switch("Clear Yaw");
    v326.builder[v334].defensive_yaw = v326.builder[v334].defensive_create:combo("Yaw", {
        [1] = "Disabled", 
        [2] = "Flick Exploit", 
        [3] = "Flick Exploit V2", 
        [4] = "Flick Exploit V3", 
        [5] = "Smart Flick Exploit", 
        [6] = "Flick Randomize", 
        [7] = "Default", 
        [8] = "Spin", 
        [9] = "Progressive Spin", 
        [10] = "Offset", 
        [11] = "Random", 
        [12] = "Side", 
        [13] = "Center", 
        [14] = "3-Way"
    });
    v326.builder[v334].exploit_direction = v326.builder[v334].defensive_create:switch("Side Based");
    v326.builder[v334].defensive_yaw_offset = v326.builder[v334].defensive_create:slider("Yaw Offset", -180, 180, 0);
    v326.builder[v334].defensive_pitch = v326.builder[v334].defensive_create:combo("Pitch", {
        [1] = "Disabled", 
        [2] = "Offset", 
        [3] = "Random", 
        [4] = "Corner", 
        [5] = "Side"
    });
    v326.builder[v334].defensive_pitch_offset = v326.builder[v334].defensive_create:slider("Pitch Offset", -89, 89, 0);
    v326.builder[v334].send_to_t = v325.builder:button("              \v\f<share-nodes>\r  Send \vCurrent State\r To \vT             ", function()

    end, true);
end;
for v336 = 1, #v326.antiaim.cond do
    v326.builder_t[v336] = {};
    v326.builder_t[v336].enable = v325.builder:switch("\v" .. "\f<square-check>\r  Override \v" .. v326.antiaim.cond[v336] .. "\r State");
    v326.builder_t[v336].yaw_left = v325.builder:slider("\v\f<left-from-line>\r  Yaw Left", -180, 180, 0, 1, "\194\176");
    v326.builder_t[v336].yaw_right = v325.builder:slider("\v\f<right-from-line>\r  Yaw Right", -180, 180, 0, 1, "\194\176");
    v326.builder_t[v336].yaw_random = v325.builder:slider("\v\f<dice-five>\r  Yaw Random", 0, 100, 0, 1, "%");
    v326.builder_t[v336].yawmodifier = v325.builder:combo("\v\f<arrows-left-right-to-line>\r  Modifier", v324.yawmodifier:list());
    v326.builder_t[v336].yawmodifier_create = v326.builder_t[v336].yawmodifier:create();
    v326.builder_t[v336].yawmodifier_offset = v326.builder_t[v336].yawmodifier_create:slider("Offset", -180, 180, 0);
    v326.builder_t[v336].yawmodifier_random = v326.builder_t[v336].yawmodifier_create:slider("Random", 0, 100, 0);
    v326.builder_t[v336].bodyyaw = v325.builder:switch("\v\f<angle>\r  Body Yaw");
    v326.builder_t[v336].bodyyaw_create = v326.builder_t[v336].bodyyaw:create();
    v326.builder_t[v336].invert = v326.builder_t[v336].bodyyaw_create:switch("Inverter");
    v326.builder_t[v336].leftlimit = v326.builder_t[v336].bodyyaw_create:slider("Left Limit", 0, 60, 60);
    v326.builder_t[v336].rightlimit = v326.builder_t[v336].bodyyaw_create:slider("Right Limit", 0, 60, 60);
    v326.builder_t[v336].options = v326.builder_t[v336].bodyyaw_create:selectable("Options", v324.options:list());
    v326.builder_t[v336].delay = v326.builder_t[v336].bodyyaw_create:slider("Jitter Speed", 1, 10, 1, 1, function(v337)
        return v337 == 1 and "NL" or v337;
    end);
    v326.builder_t[v336].bodyfreestanding = v326.builder_t[v336].bodyyaw_create:combo("Freestanding", v324.bodyfrees:list());
    v326.builder_t[v336].defensive_type = v325.builder:selectable("\v\f<explosion>\r  Break \aD8DB68FFLC", {
        [1] = "DT", 
        [2] = "Hide Shots"
    });
    v326.builder_t[v336].defensive_type_create = v326.builder_t[v336].defensive_type:create();
    v326.builder_t[v336].defensive_type_type = v326.builder_t[v336].defensive_type_create:list("\n", {
        [1] = "Default", 
        [2] = "Switch", 
        [3] = "Always"
    });
    v326.builder_t[v336].defensive = v325.builder:switch("\v\f<arrows-spin>\r  Defensive Snap");
    v326.builder_t[v336].defensive_create = v326.builder_t[v336].defensive:create();
    v326.builder_t[v336].defensive_clear = v326.builder_t[v336].defensive_create:switch("Clear Yaw");
    v326.builder_t[v336].defensive_yaw = v326.builder_t[v336].defensive_create:combo("Yaw", {
        [1] = "Disabled", 
        [2] = "Flick Exploit", 
        [3] = "Flick Exploit V2", 
        [4] = "Flick Exploit V3", 
        [5] = "Smart Flick Exploit", 
        [6] = "Flick Randomize", 
        [7] = "Default", 
        [8] = "Spin", 
        [9] = "Progressive Spin", 
        [10] = "Offset", 
        [11] = "Random", 
        [12] = "Side", 
        [13] = "Center", 
        [14] = "3-Way"
    });
    v326.builder_t[v336].exploit_direction = v326.builder_t[v336].defensive_create:switch("Side Based");
    v326.builder_t[v336].defensive_yaw_offset = v326.builder_t[v336].defensive_create:slider("Yaw Offset", -180, 180, 0);
    v326.builder_t[v336].defensive_pitch = v326.builder_t[v336].defensive_create:combo("Pitch", {
        [1] = "Disabled", 
        [2] = "Offset", 
        [3] = "Random", 
        [4] = "Corner", 
        [5] = "Side"
    });
    v326.builder_t[v336].defensive_pitch_offset = v326.builder_t[v336].defensive_create:slider("Pitch Offset", -89, 89, 0);
    v326.builder_t[v336].send_to_ct = v325.builder:button("              \v\f<share-nodes>\r  Send \vCurrent State\r To \vCT           ", function()

    end, true);
end;
for v338 = 1, #v326.antiaim.cond do
    local v339 = {
        [1] = nil, 
        [2] = 1, 
        [1] = v326.antiaim.team
    };
    local v340 = {
        [1] = nil, 
        [2] = 1, 
        [1] = v326.main.tab
    };
    do
        local l_v338_0 = v338;
        local v342 = {
            [1] = v326.antiaim.conditions, 
            [2] = function()
                -- upvalues: l_v338_0 (ref)
                return l_v338_0 ~= 1;
            end
        };
        local v343 = {
            [1] = v326.builder[l_v338_0].enable, 
            [2] = function()
                -- upvalues: l_v338_0 (ref), v326 (ref)
                if l_v338_0 == 1 then
                    return true;
                else
                    return v326.builder[l_v338_0].enable:get();
                end;
            end
        };
        local v344 = {
            [1] = v326.antiaim.conditions, 
            [2] = v326.antiaim.cond[l_v338_0]
        };
        local v345 = {
            [1] = v326.builder[l_v338_0].yawmodifier, 
            [2] = function()
                -- upvalues: v326 (ref), l_v338_0 (ref)
                if v326.builder[l_v338_0].yawmodifier:get() == "Disabled" then
                    return false;
                else
                    return true;
                end;
            end
        };
        local l_bodyyaw_0 = v326.builder[l_v338_0].bodyyaw;
        local v347 = {
            [1] = nil, 
            [2] = "Jitter", 
            [1] = v326.builder[l_v338_0].options
        };
        local l_defensive_0 = v326.builder[l_v338_0].defensive;
        local v349 = {
            [1] = v326.builder[l_v338_0].defensive_yaw, 
            [2] = function()
                -- upvalues: v326 (ref), l_v338_0 (ref)
                return v326.builder[l_v338_0].defensive_yaw:get() ~= "Disabled" and v326.builder[l_v338_0].defensive_yaw:get() ~= "Default" and v326.builder[l_v338_0].defensive_yaw:get() ~= "Random";
            end
        };
        local v350 = {
            [1] = v326.builder[l_v338_0].defensive_pitch, 
            [2] = function()
                -- upvalues: v326 (ref), l_v338_0 (ref)
                return v326.builder[l_v338_0].defensive_pitch:get() == "Offset" or v326.builder[l_v338_0].defensive_pitch:get() == "Side";
            end
        };
        local v351 = {
            [1] = v326.builder[l_v338_0].defensive_yaw, 
            [2] = function()
                -- upvalues: v326 (ref), l_v338_0 (ref)
                return string.match(v326.builder[l_v338_0].defensive_yaw:get(), "Flick");
            end
        };
        local _ = {
            [1] = v326.builder[l_v338_0].defensive_yaw, 
            [2] = function()
                -- upvalues: v326 (ref), l_v338_0 (ref)
                return v326.builder[l_v338_0].defensive_yaw:get() == "Progressive Spin";
            end
        };
        v326.builder[l_v338_0].enable:depend(v340, v342, v344, v339);
        v326.builder[l_v338_0].yaw_left:depend(v340, v343, v344, v339);
        v326.builder[l_v338_0].yaw_right:depend(v340, v343, v344, v339);
        v326.builder[l_v338_0].yaw_random:depend(v340, v343, v344, v339);
        v326.builder[l_v338_0].yawmodifier:depend(v340, v343, v344, v339);
        v326.builder[l_v338_0].yawmodifier_offset:depend(v340, v343, v344, v345, v339);
        v326.builder[l_v338_0].yawmodifier_random:depend(v340, v343, v344, v345, v339);
        v326.builder[l_v338_0].bodyyaw:depend(v340, v343, v344, v339);
        v326.builder[l_v338_0].invert:depend(v340, v343, v344, l_bodyyaw_0, v339);
        v326.builder[l_v338_0].leftlimit:depend(v340, v343, v344, l_bodyyaw_0, v339);
        v326.builder[l_v338_0].rightlimit:depend(v340, v343, v344, l_bodyyaw_0, v339);
        v326.builder[l_v338_0].options:depend(v340, v343, v344, l_bodyyaw_0, v339);
        v326.builder[l_v338_0].delay:depend(v340, v343, v344, l_bodyyaw_0, v347, v339);
        v326.builder[l_v338_0].bodyfreestanding:depend(v340, v343, v344, l_bodyyaw_0, v339);
        v326.builder[l_v338_0].defensive:depend(v340, v343, v344, v339);
        v326.builder[l_v338_0].defensive_clear:depend(v340, v343, v344, v339, l_defensive_0);
        v326.builder[l_v338_0].defensive_type:depend(v340, v343, v344, v339);
        v326.builder[l_v338_0].defensive_type_type:depend(v340, v343, v344, v339, {
            [1] = v326.builder[l_v338_0].defensive_type, 
            [2] = function()
                -- upvalues: v326 (ref), l_v338_0 (ref)
                return v326.builder[l_v338_0].defensive_type:get("DT") or v326.builder[l_v338_0].defensive_type:get("Hide Shots");
            end
        });
        v326.builder[l_v338_0].defensive_yaw:depend(v340, v343, v344, l_defensive_0, v339);
        v326.builder[l_v338_0].defensive_yaw_offset:depend(v340, v343, v344, l_defensive_0, v349, v339);
        v326.builder[l_v338_0].exploit_direction:depend(v340, v343, v344, l_defensive_0, v339, v351);
        v326.builder[l_v338_0].defensive_pitch:depend(v340, v343, v344, l_defensive_0, v339);
        v326.builder[l_v338_0].defensive_pitch_offset:depend(v340, v343, v344, l_defensive_0, v350, v339);
        v326.builder[l_v338_0].send_to_t:depend(v340, v343, v344, v339);
    end;
end;
for v353 = 1, #v326.antiaim.cond do
    local v354 = {
        [1] = nil, 
        [2] = 2, 
        [1] = v326.antiaim.team
    };
    local v355 = {
        [1] = nil, 
        [2] = 1, 
        [1] = v326.main.tab
    };
    do
        local l_v353_0 = v353;
        local v357 = {
            [1] = v326.antiaim.conditions, 
            [2] = function()
                -- upvalues: l_v353_0 (ref)
                return l_v353_0 ~= 1;
            end
        };
        local v358 = {
            [1] = v326.builder_t[l_v353_0].enable, 
            [2] = function()
                -- upvalues: l_v353_0 (ref), v326 (ref)
                if l_v353_0 == 1 then
                    return true;
                else
                    return v326.builder_t[l_v353_0].enable:get();
                end;
            end
        };
        local v359 = {
            [1] = v326.antiaim.conditions, 
            [2] = v326.antiaim.cond[l_v353_0]
        };
        local v360 = {
            [1] = v326.builder_t[l_v353_0].yawmodifier, 
            [2] = function()
                -- upvalues: v326 (ref), l_v353_0 (ref)
                if v326.builder_t[l_v353_0].yawmodifier:get() == "Disabled" then
                    return false;
                else
                    return true;
                end;
            end
        };
        local l_bodyyaw_1 = v326.builder_t[l_v353_0].bodyyaw;
        local v362 = {
            [1] = nil, 
            [2] = "Jitter", 
            [1] = v326.builder_t[l_v353_0].options
        };
        local l_defensive_1 = v326.builder_t[l_v353_0].defensive;
        local v364 = {
            [1] = v326.builder_t[l_v353_0].defensive_yaw, 
            [2] = function()
                -- upvalues: v326 (ref), l_v353_0 (ref)
                return v326.builder_t[l_v353_0].defensive_yaw:get() ~= "Disabled" and v326.builder_t[l_v353_0].defensive_yaw:get() ~= "Default" and v326.builder_t[l_v353_0].defensive_yaw:get() ~= "Random";
            end
        };
        local v365 = {
            [1] = v326.builder_t[l_v353_0].defensive_pitch, 
            [2] = function()
                -- upvalues: v326 (ref), l_v353_0 (ref)
                return v326.builder_t[l_v353_0].defensive_pitch:get() == "Offset" or v326.builder_t[l_v353_0].defensive_pitch:get() == "Side";
            end
        };
        local v366 = {
            [1] = v326.builder_t[l_v353_0].defensive_yaw, 
            [2] = function()
                -- upvalues: v326 (ref), l_v353_0 (ref)
                return string.match(v326.builder_t[l_v353_0].defensive_yaw:get(), "Flick");
            end
        };
        local _ = {
            [1] = v326.builder_t[l_v353_0].defensive_yaw, 
            [2] = function()
                -- upvalues: v326 (ref), l_v353_0 (ref)
                return v326.builder_t[l_v353_0].defensive_yaw:get() == "Progressive Spin";
            end
        };
        v326.builder_t[l_v353_0].enable:depend(v355, v357, v359, v354);
        v326.builder_t[l_v353_0].yaw_left:depend(v355, v358, v359, v354);
        v326.builder_t[l_v353_0].yaw_right:depend(v355, v358, v359, v354);
        v326.builder_t[l_v353_0].yaw_random:depend(v355, v358, v359, v354);
        v326.builder_t[l_v353_0].yawmodifier:depend(v355, v358, v359, v354);
        v326.builder_t[l_v353_0].yawmodifier_offset:depend(v355, v358, v359, v360, v354);
        v326.builder_t[l_v353_0].yawmodifier_random:depend(v355, v358, v359, v360, v354);
        v326.builder_t[l_v353_0].bodyyaw:depend(v355, v358, v359, v354);
        v326.builder_t[l_v353_0].invert:depend(v355, v358, v359, l_bodyyaw_1, v354);
        v326.builder_t[l_v353_0].leftlimit:depend(v355, v358, v359, l_bodyyaw_1, v354);
        v326.builder_t[l_v353_0].rightlimit:depend(v355, v358, v359, l_bodyyaw_1, v354);
        v326.builder_t[l_v353_0].options:depend(v355, v358, v359, l_bodyyaw_1, v354);
        v326.builder_t[l_v353_0].delay:depend(v355, v358, v359, l_bodyyaw_1, v362, v354);
        v326.builder_t[l_v353_0].bodyfreestanding:depend(v355, v358, v359, l_bodyyaw_1, v354);
        v326.builder_t[l_v353_0].defensive:depend(v355, v358, v359, v354);
        v326.builder_t[l_v353_0].defensive_clear:depend(v355, v358, v359, v354, l_defensive_1);
        v326.builder_t[l_v353_0].defensive_type:depend(v355, v358, v359, v354);
        v326.builder_t[l_v353_0].defensive_type_type:depend(v355, v358, v359, v354, {
            [1] = v326.builder_t[l_v353_0].defensive_type, 
            [2] = function()
                -- upvalues: v326 (ref), l_v353_0 (ref)
                return v326.builder_t[l_v353_0].defensive_type:get("DT") or v326.builder_t[l_v353_0].defensive_type:get("Hide Shots");
            end
        });
        v326.builder_t[l_v353_0].defensive_yaw:depend(v355, v358, v359, l_defensive_1, v354);
        v326.builder_t[l_v353_0].defensive_yaw_offset:depend(v355, v358, v359, l_defensive_1, v364, v354);
        v326.builder_t[l_v353_0].exploit_direction:depend(v355, v358, v359, l_defensive_1, v354, v366);
        v326.builder_t[l_v353_0].defensive_pitch:depend(v355, v358, v359, l_defensive_1, v354);
        v326.builder_t[l_v353_0].defensive_pitch_offset:depend(v355, v358, v359, l_defensive_1, v365, v354);
        v326.builder_t[l_v353_0].send_to_ct:depend(v355, v358, v359, v354);
    end;
end;
local function v369(v368)
    -- upvalues: v326 (ref)
    v326.builder[v368].enable:set(v326.builder_t[v368].enable:get());
    v326.builder[v368].yaw_left:set(v326.builder_t[v368].yaw_left:get());
    v326.builder[v368].yaw_right:set(v326.builder_t[v368].yaw_right:get());
    v326.builder[v368].yaw_random:set(v326.builder_t[v368].yaw_random:get());
    v326.builder[v368].yawmodifier:set(v326.builder_t[v368].yawmodifier:get());
    v326.builder[v368].yawmodifier_offset:set(v326.builder_t[v368].yawmodifier_offset:get());
    v326.builder[v368].yawmodifier_random:set(v326.builder_t[v368].yawmodifier_random:get());
    v326.builder[v368].bodyyaw:set(v326.builder_t[v368].bodyyaw:get());
    v326.builder[v368].invert:set(v326.builder_t[v368].invert:get());
    v326.builder[v368].leftlimit:set(v326.builder_t[v368].leftlimit:get());
    v326.builder[v368].rightlimit:set(v326.builder_t[v368].rightlimit:get());
    v326.builder[v368].options:set(v326.builder_t[v368].options:get());
    v326.builder[v368].delay:set(v326.builder_t[v368].delay:get());
    v326.builder[v368].bodyfreestanding:set(v326.builder_t[v368].bodyfreestanding:get());
    v326.builder[v368].defensive:set(v326.builder_t[v368].defensive:get());
    v326.builder[v368].defensive_clear:set(v326.builder_t[v368].defensive_clear:get());
    v326.builder[v368].defensive_type:set(v326.builder_t[v368].defensive_type:get());
    v326.builder[v368].defensive_type_type:set(v326.builder_t[v368].defensive_type_type:get());
    v326.builder[v368].defensive_yaw:set(v326.builder_t[v368].defensive_yaw:get());
    v326.builder[v368].exploit_direction:set(v326.builder_t[v368].exploit_direction:get());
    v326.builder[v368].defensive_yaw_offset:set(v326.builder_t[v368].defensive_yaw_offset:get());
    v326.builder[v368].defensive_pitch:set(v326.builder_t[v368].defensive_pitch:get());
    v326.builder[v368].defensive_pitch_offset:set(v326.builder_t[v368].defensive_pitch_offset:get());
    common.add_event("Successfully sent to T", "moon-stars");
    cvar.play:call("ambient\\tones\\elev1");
end;
local function v371(v370)
    -- upvalues: v326 (ref)
    v326.builder_t[v370].enable:set(v326.builder[v370].enable:get());
    v326.builder_t[v370].yaw_left:set(v326.builder[v370].yaw_left:get());
    v326.builder_t[v370].yaw_right:set(v326.builder[v370].yaw_right:get());
    v326.builder_t[v370].yaw_random:set(v326.builder[v370].yaw_random:get());
    v326.builder_t[v370].yawmodifier:set(v326.builder[v370].yawmodifier:get());
    v326.builder_t[v370].yawmodifier_offset:set(v326.builder[v370].yawmodifier_offset:get());
    v326.builder_t[v370].yawmodifier_random:set(v326.builder[v370].yawmodifier_random:get());
    v326.builder_t[v370].bodyyaw:set(v326.builder[v370].bodyyaw:get());
    v326.builder_t[v370].invert:set(v326.builder[v370].invert:get());
    v326.builder_t[v370].leftlimit:set(v326.builder[v370].leftlimit:get());
    v326.builder_t[v370].rightlimit:set(v326.builder[v370].rightlimit:get());
    v326.builder_t[v370].options:set(v326.builder[v370].options:get());
    v326.builder_t[v370].delay:set(v326.builder[v370].delay:get());
    v326.builder_t[v370].bodyfreestanding:set(v326.builder[v370].bodyfreestanding:get());
    v326.builder_t[v370].defensive:set(v326.builder[v370].defensive:get());
    v326.builder_t[v370].defensive_clear:set(v326.builder[v370].defensive_clear:get());
    v326.builder_t[v370].defensive_type:set(v326.builder[v370].defensive_type:get());
    v326.builder_t[v370].defensive_type_type:set(v326.builder[v370].defensive_type_type:get());
    v326.builder_t[v370].defensive_yaw:set(v326.builder[v370].defensive_yaw:get());
    v326.builder_t[v370].exploit_direction:set(v326.builder[v370].exploit_direction:get());
    v326.builder_t[v370].defensive_yaw_offset:set(v326.builder[v370].defensive_yaw_offset:get());
    v326.builder_t[v370].defensive_pitch:set(v326.builder[v370].defensive_pitch:get());
    v326.builder_t[v370].defensive_pitch_offset:set(v326.builder[v370].defensive_pitch_offset:get());
    common.add_event("Successfully sent to CT", "moon-stars");
    cvar.play:call("ambient\\tones\\elev1");
end;
for v372 = 1, #v326.antiaim.cond do
    do
        local l_v372_0 = v372;
        v326.builder[l_v372_0].send_to_t:set_callback(function()
            -- upvalues: v371 (ref), l_v372_0 (ref)
            v371(l_v372_0);
        end);
        v326.builder_t[l_v372_0].send_to_ct:set_callback(function()
            -- upvalues: v369 (ref), l_v372_0 (ref)
            v369(l_v372_0);
        end);
    end;
end;
local v374 = l_pui_0.setup({
    [1] = v326.builder_t, 
    [2] = v326.builder
}, true);
local v375 = {};
local v376 = {};
configs_db = db.genesis_beta3 or {};
configs_db.cfg_list = configs_db.cfg_list or {
    [1] = {
        [1] = "Flick \vExploit + Unhittable", 
        [2] = "W1t7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IlJhbmRvbSIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiRGVmYXVsdCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTI2LjAsImRlbGF5IjoxLjAsImVuYWJsZSI6ZmFsc2UsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjpmYWxzZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjcuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjYuMCwieWF3bW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi01NS4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjguMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfY2xlYXIiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJSYW5kb20iLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkZsaWNrIEV4cGxvaXQgVjIiLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6LTkwLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6NS4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6NS4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNDEuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo1LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiMy1XYXkiLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6LTM4LjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZXhwbG9pdF9kaXJlY3Rpb24iOnRydWUsImZvcmNlX2RlZiI6dHJ1ZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjYuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjYuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6LTM4LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6Ny4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJQZWVrIEZha2UiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiUmFuZG9tIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJGbGljayBFeHBsb2l0IFYyIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi05MC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjp0cnVlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6MTIuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjEyLjAsInlhd21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi02NS4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjguMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfY2xlYXIiOnRydWUsImRlZmVuc2l2ZV9waXRjaCI6Ik9mZnNldCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi04OS4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xNC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjpmYWxzZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjcuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjguMCwieWF3bW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi02MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfY2xlYXIiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmZzZXQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotODkuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiRGVmYXVsdCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTQuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo2LjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0Ijo2LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjoxNS4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotNzMuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiUHJvZ3Jlc3NpdmUgU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6dHJ1ZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjUuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjQuMCwieWF3bW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi03LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6OC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IlByb2dyZXNzaXZlIFNwaW4iLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6LTEwLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0IjoxMi4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MTguMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJ+Il0sImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjowLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6ZmFsc2UsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjpmYWxzZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjAuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjAuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0IjowLjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0IjowLjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjoxMC4wfV0sW3siYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJSYW5kb20iLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkRlZmF1bHQiLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6My4wLCJkZWxheSI6MS4wLCJlbmFibGUiOmZhbHNlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo3LjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0Ijo2LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTUuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo4LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiT2Zmc2V0IiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJGbGljayBFeHBsb2l0IFYyIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi05MC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjp0cnVlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6NS4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6NS4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNDEuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo1LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IjMtV2F5IiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjMwLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0IjoxMi4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MTIuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6LTU5LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6Ny4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJQZWVrIEZha2UiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiUmFuZG9tIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJGbGljayBFeHBsb2l0IFYyIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi05MC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjp0cnVlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6OC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6OC4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNjUuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo4LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmZzZXQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotODkuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTQuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo3LjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0Ijo4LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNjAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjowLjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmZzZXQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotODkuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiRGVmYXVsdCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTQuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo2LjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0Ijo2LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjowLjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi03My4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJQcm9ncmVzc2l2ZSBTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xMC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjp0cnVlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6NS4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6NC4wLCJ5YXdtb2RpZmllciI6IkNlbnRlciIsInlhd21vZGlmaWVyX29mZnNldCI6LTcuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo4LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiUHJvZ3Jlc3NpdmUgU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6dHJ1ZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjEyLjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0IjoxOC4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjowLjAsInlhd21vZGlmaWVyX3JhbmRvbSI6MC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3IjpmYWxzZSwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjpmYWxzZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MC4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjowLjAsInlhd21vZGlmaWVyX3JhbmRvbSI6MC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3IjpmYWxzZSwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjpmYWxzZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MC4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjowLjAsInlhd21vZGlmaWVyX3JhbmRvbSI6MC4wfV1d"
    }
};
configs_db.menu_list = configs_db.menu_list or {
    [1] = "Flick Exploit + Unhittable"
};
configs_db.cfg_list[1][2] = "W1t7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IlJhbmRvbSIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiRGVmYXVsdCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTI2LjAsImRlbGF5IjoxLjAsImVuYWJsZSI6ZmFsc2UsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjpmYWxzZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjcuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjYuMCwieWF3bW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi01NS4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjguMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfY2xlYXIiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJSYW5kb20iLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkZsaWNrIEV4cGxvaXQgVjIiLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6LTkwLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6NS4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6NS4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNDEuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo1LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiMy1XYXkiLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6LTM4LjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZXhwbG9pdF9kaXJlY3Rpb24iOnRydWUsImZvcmNlX2RlZiI6dHJ1ZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjYuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjYuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6LTM4LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6Ny4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJQZWVrIEZha2UiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiUmFuZG9tIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJGbGljayBFeHBsb2l0IFYyIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi05MC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjp0cnVlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6MTIuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjEyLjAsInlhd21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi02NS4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjguMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfY2xlYXIiOnRydWUsImRlZmVuc2l2ZV9waXRjaCI6Ik9mZnNldCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi04OS4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xNC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjpmYWxzZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjcuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjguMCwieWF3bW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi02MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfY2xlYXIiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmZzZXQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotODkuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiRGVmYXVsdCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTQuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo2LjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0Ijo2LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjoxNS4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotNzMuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiUHJvZ3Jlc3NpdmUgU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6dHJ1ZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjUuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjQuMCwieWF3bW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi03LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6OC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IlByb2dyZXNzaXZlIFNwaW4iLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6LTEwLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0IjoxMi4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MTguMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJ+Il0sImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjowLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6ZmFsc2UsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjpmYWxzZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjAuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjAuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0IjowLjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0IjowLjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjoxMC4wfV0sW3siYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJSYW5kb20iLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkRlZmF1bHQiLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6My4wLCJkZWxheSI6MS4wLCJlbmFibGUiOmZhbHNlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo3LjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0Ijo2LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTUuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo4LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiT2Zmc2V0IiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJGbGljayBFeHBsb2l0IFYyIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi05MC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjp0cnVlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6NS4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6NS4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNDEuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo1LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IjMtV2F5IiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjMwLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0IjoxMi4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MTIuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6LTU5LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6Ny4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJQZWVrIEZha2UiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiUmFuZG9tIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJGbGljayBFeHBsb2l0IFYyIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi05MC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjp0cnVlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6OC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6OC4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNjUuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo4LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmZzZXQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotODkuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTQuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo3LjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0Ijo4LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNjAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjowLjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmZzZXQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotODkuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiRGVmYXVsdCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTQuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo2LjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0Ijo2LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjowLjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi03My4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJQcm9ncmVzc2l2ZSBTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xMC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjp0cnVlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6NS4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6NC4wLCJ5YXdtb2RpZmllciI6IkNlbnRlciIsInlhd21vZGlmaWVyX29mZnNldCI6LTcuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo4LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiUHJvZ3Jlc3NpdmUgU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6dHJ1ZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjEyLjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0IjoxOC4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjowLjAsInlhd21vZGlmaWVyX3JhbmRvbSI6MC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3IjpmYWxzZSwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjpmYWxzZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MC4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjowLjAsInlhd21vZGlmaWVyX3JhbmRvbSI6MC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3IjpmYWxzZSwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjpmYWxzZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MC4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjowLjAsInlhd21vZGlmaWVyX3JhbmRvbSI6MC4wfV1d";
v376.save_config = function(v377)
    -- upvalues: v374 (ref), l_base64_0 (ref)
    if v377 == 1 then
        return;
    else
        local v378 = v374:save();
        configs_db.cfg_list[v377][2] = l_base64_0.encode(json.stringify(v378));
        db.genesis_beta3 = configs_db;
        return;
    end;
end;
v376.update_values = function(v379)
    local v380 = configs_db.cfg_list[v379][1] .. "\v - Active";
    for v381, v382 in ipairs(configs_db.cfg_list) do
        configs_db.menu_list[v381] = v382[1];
    end;
    configs_db.menu_list[v379] = v380;
end;
v376.create_config = function(v383)
    if type(v383) ~= "string" then
        return;
    elseif v383 == nil or v383 == "" or v383 == " " then
        common.add_notify("genesis.lua", "Wrong Name");
        return;
    else
        for v384 = #configs_db.menu_list, 1, -1 do
            if configs_db.menu_list[v384] == v383 then
                common.add_notify("genesis.lua", "Another config has the same name");
                return;
            end;
        end;
        if #configs_db.cfg_list > 8 then
            common.add_notify("genesis.lua", "Maximum number of configs: 9");
            return;
        else
            local v385 = {
                [1] = nil, 
                [2] = "", 
                [1] = v383
            };
            table.insert(configs_db.cfg_list, v385);
            table.insert(configs_db.menu_list, v383);
            db.genesis_beta3 = configs_db;
            return;
        end;
    end;
end;
v376.remove_config = function(v386)
    if v386 == 1 then
        return;
    else
        local v387 = configs_db.cfg_list[v386][1];
        for v388 = #configs_db.cfg_list, 1, -1 do
            if configs_db.cfg_list[v388][1] == v387 then
                table.remove(configs_db.cfg_list, v388);
                table.remove(configs_db.menu_list, v388);
            end;
        end;
        db.genesis_beta3 = configs_db;
        return;
    end;
end;
v376.load_config = function(v389)
    -- upvalues: v374 (ref), l_base64_0 (ref)
    if configs_db.cfg_list[v389][2] == nil or configs_db.cfg_list[v389][2] == "" then
        print("Problem with: " .. v389 .. " Config");
        return;
    elseif #configs_db.cfg_list < v389 then
        print("Problem with: " .. v389 .. " Config");
        return;
    else
        v374:load(json.parse(l_base64_0.decode(configs_db.cfg_list[v389][2])));
        cvar.play:call("ambient\\tones\\elev1");
        return;
    end;
end;
v375.cfg_selector = v326.antiaim.config_manager_create:list("", configs_db.menu_list);
v375.name = v326.antiaim.config_manager_create:input("", "Config Name");
v375.create = v326.antiaim.config_manager_create:button("  \v\f<layer-plus>  ", function()
    -- upvalues: v376 (ref), v375 (ref)
    v376.create_config(v375.name:get());
    v375.cfg_selector:update(configs_db.menu_list);
    cvar.play:call("ambient\\tones\\elev1");
end, true);
v375.create:tooltip("Create Config");
v375.remove = v326.antiaim.config_manager_create:button("   \v\f<trash-xmark>   ", function()
    -- upvalues: v376 (ref), v375 (ref)
    v376.remove_config(v375.cfg_selector:get());
    v375.cfg_selector:update(configs_db.menu_list);
    cvar.play:call("ambient\\tones\\elev1");
end, true);
v375.remove:tooltip("Remove Config");
v375.save = v326.antiaim.config_manager_create:button("   \v\f<floppy-disk>   ", function()
    -- upvalues: v376 (ref), v375 (ref)
    v376.save_config(v375.cfg_selector:get());
    cvar.play:call("ambient\\tones\\elev1");
end, true);
v375.save:tooltip("Save Config");
v375.load = v326.antiaim.config_manager_create:button("  \v\f<check>  ", function()
    -- upvalues: v376 (ref), v375 (ref)
    v376.update_values(v375.cfg_selector:get());
    v376.load_config(v375.cfg_selector:get());
    v375.cfg_selector:update(configs_db.menu_list);
    cvar.play:call("ambient\\tones\\elev1");
end, true);
v375.load:tooltip("Load Config");
v375.import = v326.antiaim.config_manager_create:button("  \v\f<download>  ", function()
    -- upvalues: v374 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
    v374:load(json.parse(l_base64_0.decode(l_clipboard_0.get())));
    cvar.play:call("ambient\\tones\\elev1");
end, true);
v375.import:tooltip("Import Config");
v375.export = v326.antiaim.config_manager_create:button("  \v\f<share-nodes>  ", function()
    -- upvalues: l_clipboard_0 (ref), l_base64_0 (ref), v374 (ref)
    l_clipboard_0.set(l_base64_0.encode(json.stringify(v374:save())));
    cvar.play:call("ambient\\tones\\elev1");
end, true);
v375.export:tooltip("Export Config");
local function v396(v390)
    -- upvalues: v324 (ref)
    local v391 = entity.get_local_player();
    if not v391 then
        return;
    else
        local v392 = bit.band(v391.m_fFlags, 1) == 1;
        local v393 = bit.band(v391.m_fFlags, 1) == 0 or v390.in_jump;
        local v394 = v391.m_flDuckAmount > 0.7 or v324.fakeduck:get();
        local v395 = v391.m_vecVelocity:length() > 5;
        if v393 and v394 then
            return "AIR~C";
        elseif v393 then
            return "AIR";
        elseif v394 and v395 then
            return "SNAKING";
        elseif v394 then
            return "CROUCHING";
        elseif v392 and v395 and v324.slowwalk:get() then
            return "WALKING";
        elseif v392 and v395 then
            return "RUNNING";
        elseif v392 then
            return "STANDING";
        else
            return "GENERAL";
        end;
    end;
end;
local v397 = 1;
local v398 = false;
local function v403(v399)
    -- upvalues: v398 (ref), v326 (ref), v397 (ref), v396 (ref)
    local v400 = entity.get_local_player();
    if not v400 then
        return;
    else
        local l_m_iTeamNum_0 = v400.m_iTeamNum;
        local v402 = rage.exploit:get() < 0.9;
        if l_m_iTeamNum_0 ~= 3 then
            if v398 and v326.builder_t[10].enable:get() then
                v397 = 10;
            elseif v402 and v326.builder_t[9].enable:get() then
                v397 = 9;
            elseif v326.builder_t[8].enable:get() and v396(v399) == "AIR~C" then
                v397 = 8;
            elseif v326.builder_t[7].enable:get() and v396(v399) == "AIR" then
                v397 = 7;
            elseif v326.builder_t[6].enable:get() and v396(v399) == "SNAKING" then
                v397 = 6;
            elseif v326.builder_t[5].enable:get() and v396(v399) == "CROUCHING" then
                v397 = 5;
            elseif v326.builder_t[4].enable:get() and v396(v399) == "WALKING" then
                v397 = 4;
            elseif v326.builder_t[3].enable:get() and v396(v399) == "RUNNING" then
                v397 = 3;
            elseif v326.builder_t[2].enable:get() and v396(v399) == "STANDING" then
                v397 = 2;
            else
                v397 = 1;
            end;
        elseif v398 and v326.builder[10].enable:get() then
            v397 = 10;
        elseif v402 and v326.builder[9].enable:get() then
            v397 = 9;
        elseif v326.builder[8].enable:get() and v396(v399) == "AIR~C" then
            v397 = 8;
        elseif v326.builder[7].enable:get() and v396(v399) == "AIR" then
            v397 = 7;
        elseif v326.builder[6].enable:get() and v396(v399) == "SNAKING" then
            v397 = 6;
        elseif v326.builder[5].enable:get() and v396(v399) == "CROUCHING" then
            v397 = 5;
        elseif v326.builder[4].enable:get() and v396(v399) == "WALKING" then
            v397 = 4;
        elseif v326.builder[3].enable:get() and v396(v399) == "RUNNING" then
            v397 = 3;
        elseif v326.builder[2].enable:get() and v396(v399) == "STANDING" then
            v397 = 2;
        else
            v397 = 1;
        end;
        return;
    end;
end;
local v404 = {
    defensive_check = 0, 
    cmd = 0, 
    tickbase = 0, 
    defensive = 0
};
local function v405()
    -- upvalues: v404 (ref)
    v404.defensive = 0;
    v404.defensive_check = 0;
    v404.cmd = 0;
    v404.tickbase = 0;
end;
events.createmove_run:set(function(_)
    -- upvalues: v405 (ref), v404 (ref)
    if rage.exploit:get() < 1 then
        v405();
        return;
    else
        me = entity.get_local_player();
        if not me or not me:is_alive() then
            v404.defensive = 0;
            v404.defensive_check = 0;
            return;
        else
            v404.tickbase = entity.get_local_player().m_nTickBase;
            v404.defensive_check = math.max(v404.tickbase, v404.defensive_check);
            v404.cmd = 0;
            if v404.defensive_check > v404.tickbase then
                v404.defensive = math.abs(v404.tickbase - v404.defensive_check);
            end;
            if math.abs(v404.tickbase - v404.defensive_check) > 64 then
                v404.defensive = 0;
                v404.defensive_check = 0;
            end;
            return;
        end;
    end;
end);
is_defensive_active = function(_)
    -- upvalues: v404 (ref)
    is_defensive = v404.tickbase_check and v404.defensive > 2 and v404.defensive < 14;
    return is_defensive;
end;
local function v412(v408, v409)
    local v410 = v408 - v408 * v409 / 100;
    local v411 = v408 + v408 * v409 / 100;
    return math.random(v410, v411);
end;
local function v415(v413, v414)
    rage.antiaim:override_hidden_yaw_offset(v413);
    rage.antiaim:override_hidden_pitch(v414);
end;
local function v419(v416, v417, v418)
    -- upvalues: v324 (ref)
    if v416 then
        v324.options:override("");
        v324.inverter:override(v418);
        v324.yawmodifier:override("Disabled");
    end;
    if v417 then
        v324.yawoffset:override(v417);
    end;
end;
local function v420()
    -- upvalues: v324 (ref)
    v324.hidden:override(true);
    v324.lagoptions:override("Always On");
    v324.hsoptions:override("Break LC");
end;
local v421 = v326.builder_t[v397];
local v422 = false;
local v423 = 0;
local _ = 0;
local v425 = 0;
local v426 = 0;
local v427 = 1;
local function v438(v428)
    -- upvalues: v403 (ref), v398 (ref), v421 (ref), v326 (ref), v397 (ref), v423 (ref), v422 (ref), v324 (ref), v412 (ref), v404 (ref), v419 (ref), v425 (ref), v307 (ref), v426 (ref), v427 (ref), v420 (ref), v415 (ref), v396 (ref)
    local v429 = entity.get_local_player();
    if not v429 then
        return;
    else
        v403(v428);
        v398 = false;
        if v429.m_iTeamNum == 3 then
            v421 = v326.builder[v397];
        else
            v421 = v326.builder_t[v397];
        end;
        if globals.tickcount > v423 + v421.delay:get() then
            if v428.choked_commands == 0 then
                v422 = not v422;
                v423 = globals.tickcount;
            end;
        elseif globals.tickcount < v423 then
            v423 = globals.tickcount;
        end;
        v324.hidden:override(false);
        v324.aa_enable:override(true);
        v324.pitch:override(v326.antiaim.pitch:get());
        v324.yaw:override("Backward");
        v324.yawoffset:override(rage.antiaim:inverter() and v412(v421.yaw_left:get(), v421.yaw_random:get()) or v412(v421.yaw_right:get(), v421.yaw_random:get()));
        v324.avoidbackstab:override(v326.antiaim.additions:get("Avoid Backstab"));
        v324.yawmodifier:override(v421.yawmodifier:get());
        v324.yawmodoffset:override(v412(v421.yawmodifier_offset:get(), v421.yawmodifier_random:get()));
        v324.bodyyaw:override(v421.bodyyaw:get());
        v324.leftlimit:override(v421.leftlimit:get());
        v324.rightlimit:override(v421.rightlimit:get());
        v324.bodyfrees:override(v421.bodyfreestanding:get());
        v324.freestanding:override(v326.antiaim.freestanding:get());
        v324.disableyawmod:override(v326.antiaim.freestanding_disableyawmod:get());
        v324.bodyfreestanding:override(v326.antiaim.freestanding_bodyfreestanding:get());
        v324.lagoptions:override(v421.defensive_type:get("DT") and "Always On" or "On Peek");
        v324.hsoptions:override(v421.defensive_type:get("Hide Shots") and "Break LC" or "Favor Fire Rate");
        if v421.delay:get() == 1 then
            v324.inverter:override(v421.invert:get());
            v324.options:override(v421.options:get());
        elseif v421.options:get("Jitter") then
            v324.options:override("");
            v324.inverter:override(v422);
        end;
        local v430 = v421.defensive_yaw_offset:get();
        if v421.defensive_type_type:get() ~= 1 and (v421.defensive_type:get("DT") or v421.defensive_type:get("Hide Shots")) and not string.match(v421.defensive_yaw:get(), "Flick") then
            if v421.defensive_type_type:get() == 2 then
                v428.force_defensive = v428.choked_commands == 1 and v428.send_packet == true and (not (v404.defensive >= 2) or v404.defensive > 13);
            elseif v421.defensive_type_type:get() == 3 then
                v428.force_defensive = v428.choked_commands == 1 and v428.send_packet == true and (not (v404.defensive >= 4) or v404.defensive > 13);
            end;
        end;
        if v421.defensive:get() then
            if v421.defensive_clear:get() and is_defensive_active(v429) then
                v419(true, nil, v421.invert:get());
            end;
            if v421.defensive_yaw:get() == "Default" then
                v324.hidden:override(true);
                v425 = 0;
            elseif v421.defensive_yaw:get() == "Flick Exploit" then
                v324.hidden:override(true);
                if v421.exploit_direction:get() then
                    v425 = rage.antiaim:inverter() and -v421.defensive_yaw_offset:get() or v421.defensive_yaw_offset:get();
                else
                    v425 = v421.defensive_yaw_offset:get();
                end;
                v428.force_defensive = v428.choked_commands == 1 and v428.send_packet == true;
                rage.antiaim:override_hidden_yaw_offset(v425);
            elseif v421.defensive_yaw:get() == "Flick Exploit V2" then
                v324.hidden:override(true);
                if v421.exploit_direction:get() then
                    v425 = rage.antiaim:inverter() and -v421.defensive_yaw_offset:get() or v421.defensive_yaw_offset:get();
                else
                    v425 = v421.defensive_yaw_offset:get();
                end;
                v428.force_defensive = v428.choked_commands == 1 and v428.send_packet == true and (not (v404.defensive >= 4) or v404.defensive > 13);
                rage.antiaim:override_hidden_yaw_offset(v425);
            elseif v421.defensive_yaw:get() == "Flick Exploit V3" then
                v324.hidden:override(true);
                if v421.exploit_direction:get() then
                    v425 = rage.antiaim:inverter() and -v421.defensive_yaw_offset:get() or v421.defensive_yaw_offset:get();
                else
                    v425 = v421.defensive_yaw_offset:get();
                end;
                v428.force_defensive = v428.choked_commands == 1 and v428.send_packet == true and (not (v404.defensive >= 2) or v404.defensive > 13);
                rage.antiaim:override_hidden_yaw_offset(v425);
            elseif v421.defensive_yaw:get() == "Smart Flick Exploit" then
                v324.hidden:override(true);
                if v421.exploit_direction:get() then
                    v425 = rage.antiaim:inverter() and -v421.defensive_yaw_offset:get() or v421.defensive_yaw_offset:get();
                else
                    v425 = v421.defensive_yaw_offset:get();
                end;
                local v431 = entity.get_threat();
                if v431 then
                    local v432 = v431:get_xuid();
                    if v432 then
                        if v307[v432] == true then
                            v428.force_defensive = v428.choked_commands == 1 and v428.send_packet == true and (not (v404.defensive >= 4) or v404.defensive > 13);
                        else
                            v428.force_defensive = v428.choked_commands == 1 and v428.send_packet == true and (not (v404.defensive >= 2) or v404.defensive > 13);
                        end;
                    else
                        v428.force_defensive = v428.choked_commands == 1 and v428.send_packet == true and (not (v404.defensive >= 2) or v404.defensive > 13);
                    end;
                else
                    v428.force_defensive = v428.choked_commands == 1 and v428.send_packet == true and (not (v404.defensive >= 2) or v404.defensive > 13);
                end;
                rage.antiaim:override_hidden_yaw_offset(v425);
            elseif v421.defensive_yaw:get() == "Flick Randomize" then
                v324.hidden:override(true);
                if v421.exploit_direction:get() then
                    v425 = rage.antiaim:inverter() and -math.random(v421.defensive_yaw_offset:get() - 10, v421.defensive_yaw_offset:get() + 10) or math.random(v421.defensive_yaw_offset:get() - 10, v421.defensive_yaw_offset:get() + 10);
                else
                    v425 = v421.defensive_yaw_offset:get();
                end;
                v428.force_defensive = v428.choked_commands == 1 and v428.send_packet == true and (not (v404.defensive >= math.random(1, 4)) or v404.defensive > math.random(11, 14));
                rage.antiaim:override_hidden_yaw_offset(v425);
            elseif v421.defensive_yaw:get() == "Spin" then
                if is_defensive_active(v429) then
                    if v430 > 0 then
                        if v425 <= 179 then
                            v425 = v425 + v421.defensive_yaw_offset:get();
                        else
                            v425 = -v425 - v421.defensive_yaw_offset:get();
                        end;
                    elseif v425 >= -179 then
                        v425 = v425 + v421.defensive_yaw_offset:get();
                    else
                        v425 = -v425 - v421.defensive_yaw_offset:get();
                    end;
                end;
                v324.hidden:override(true);
                rage.antiaim:override_hidden_yaw_offset(v425);
            elseif v421.defensive_yaw:get() == "Progressive Spin" then
                if is_defensive_active(v429) then
                    if v430 > 0 then
                        if v425 <= 179 then
                            v425 = v425 + (v430 + v426);
                        else
                            v425 = -v425 - (v430 + v426);
                        end;
                    elseif v425 >= -179 then
                        v425 = v425 + (v430 - v426);
                    else
                        v425 = -v425 - (v430 - v426);
                    end;
                end;
                v324.hidden:override(true);
                rage.antiaim:override_hidden_yaw_offset(v425);
                if v427 == 1 then
                    v426 = v426 + 1;
                    if v426 >= 10 then
                        v426 = 10;
                        v427 = -1;
                    end;
                elseif v427 == -1 then
                    v426 = v426 - 1;
                    if v426 <= 0 then
                        v426 = 0;
                        v427 = 1;
                    end;
                end;
            elseif v421.defensive_yaw:get() == "Offset" then
                v324.hidden:override(true);
                rage.antiaim:override_hidden_yaw_offset(v430);
            elseif v421.defensive_yaw:get() == "Random" then
                v324.hidden:override(true);
                rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
            elseif v421.defensive_yaw:get() == "Side" then
                v324.hidden:override(true);
                rage.antiaim:override_hidden_yaw_offset(rage.antiaim:inverter() and v430 or -v430);
            elseif v421.defensive_yaw:get() == "Center" then
                v324.hidden:override(true);
                rage.antiaim:override_hidden_yaw_offset(globals.tickcount % 4 > 1 and v430 or -v430);
            elseif v421.defensive_yaw:get() == "3-Way" then
                if globals.tickcount % 3 == 0 then
                    rage.antiaim:override_hidden_yaw_offset(v430 - v324.yawoffset:get());
                elseif globals.tickcount % 3 == 1 then
                    rage.antiaim:override_hidden_yaw_offset(v324.yawoffset:get());
                elseif globals.tickcount % 3 == 2 then
                    rage.antiaim:override_hidden_yaw_offset(-v430 + v324.yawoffset:get());
                end;
                v324.hidden:override(true);
            else
                rage.antiaim:override_hidden_yaw_offset(v324.yawoffset:get());
            end;
            if v421.defensive_pitch:get() == "Offset" then
                v324.hidden:override(true);
                rage.antiaim:override_hidden_pitch(v421.defensive_pitch_offset:get());
            elseif v421.defensive_pitch:get() == "Random" then
                v324.hidden:override(true);
                rage.antiaim:override_hidden_pitch(math.random(-89, 89));
            elseif v421.defensive_pitch:get() == "Corner" then
                if globals.tickcount % 3 == 0 then
                    rage.antiaim:override_hidden_pitch(0);
                elseif globals.tickcount % 3 == 1 then
                    rage.antiaim:override_hidden_pitch(-89);
                elseif globals.tickcount % 3 == 2 then
                    rage.antiaim:override_hidden_pitch(0);
                end;
                v324.hidden:override(true);
            elseif v421.defensive_pitch:get() == "Side" then
                v324.hidden:override(true);
                rage.antiaim:override_hidden_pitch(rage.antiaim:inverter() and v421.defensive_pitch_offset:get() or -v421.defensive_pitch_offset:get());
            end;
        end;
        if v326.antiaim.freestanding_flick:get() and v326.antiaim.freestanding:get() then
            if not rage.antiaim:get_target(true) then
                return;
            elseif not v429:get_anim_state() then
                return;
            else
                lp_yaw = math.floor(v429:get_anim_state().abs_yaw) - 180;
                v398 = true;
                if v326.antiaim.freestanding_hit:get() then
                    if not entity.get_threat(true) then
                        return;
                    else
                        v420();
                        v415(lp_yaw > 0 and 180 or -180, v326.antiaim.freestanding_pitch:get());
                    end;
                else
                    v420();
                    v415(lp_yaw > 0 and 180 or -180, v326.antiaim.freestanding_pitch:get());
                end;
            end;
        end;
        if v326.antiaim.yaw:get() == "Local View" then
            v324.yawbase:override("Local View");
        elseif v326.antiaim.yaw:get() == "At Target" then
            v324.yawbase:override("At Target");
        elseif v326.antiaim.yaw:get() == "Left" then
            v324.yawbase:override("Local View");
            v324.yawoffset:override(-90);
            v398 = true;
            v419(v326.antiaim.yaw_static:get(), nil, false);
            if v326.antiaim.yaw_flick:get() then
                if v326.antiaim.yaw_hit:get() then
                    if not entity.get_threat(true) then
                        return;
                    else
                        v420();
                        v415(180, v326.antiaim.yaw_pitch:get());
                    end;
                else
                    v420();
                    v415(180, v326.antiaim.yaw_pitch:get());
                end;
            end;
        elseif v326.antiaim.yaw:get() == "Right" then
            v324.yawbase:override("Local View");
            v324.yawoffset:override(90);
            v398 = true;
            v419(v326.antiaim.yaw_static:get(), nil, false);
            if v326.antiaim.yaw_flick:get() then
                if v326.antiaim.yaw_hit:get() then
                    if not entity.get_threat(true) then
                        return;
                    else
                        v420();
                        v415(180, v326.antiaim.yaw_pitch:get());
                    end;
                else
                    v420();
                    v415(180, v326.antiaim.yaw_pitch:get());
                end;
            end;
        elseif v326.antiaim.yaw:get() == "Forward" then
            v324.yawbase:override("Local View");
            v324.yawoffset:override(180);
            v419(v326.antiaim.yaw_static:get(), nil, false);
            if v326.antiaim.yaw_flick:get() then
                if v326.antiaim.yaw_hit:get() then
                    if not entity.get_threat(true) then
                        return;
                    else
                        v420();
                        v415(180, v326.antiaim.yaw_pitch:get());
                    end;
                else
                    v420();
                    v415(180, v326.antiaim.yaw_pitch:get());
                end;
            end;
        end;
        v324.avoidbackstab:override(v326.antiaim.additions:get("Avoid Backstab"));
        if v326.antiaim.additions:get("Warmup Anti-Aim") and entity.get_game_rules().m_bWarmupPeriod then
            v324.bodyyaw:override(false);
            v419(true, nil, false);
        end;
        if v326.antiaim.additions:get("Safe Head") then
            local v433 = v429:get_player_weapon();
            if not v433 then
                return;
            else
                local v434 = v433:get_classname();
                if not v434 then
                    return;
                else
                    if v396(v428) == "AIR~C" then
                        if v326.antiaim.safe_head:get("Air~C Knife") and v434 == "CKnife" then
                            v419(true, -4, true);
                        end;
                        if v326.antiaim.safe_head:get("Air~C Taser") and v434 == "CWeaponTaser" then
                            v419(true, -4, true);
                        end;
                    end;
                    if v326.antiaim.safe_head:get("Height Difference") then
                        local v435 = entity.get_threat(true);
                        if not v435 then
                            return;
                        else
                            local v436 = v429:get_hitbox_position(1);
                            local v437 = v435:get_hitbox_position(1);
                            if not v436 then
                                return;
                            elseif not v437 then
                                return;
                            elseif v436.z - v437.z > v326.antiaim.safe_head_difference:get() then
                                v419(true, -4, true);
                            end;
                        end;
                    end;
                end;
            end;
        end;
        if entity.get_game_rules().m_gamePhase == 5 or entity.get_game_rules().m_gamePhase == 4 then
            v428.force_defensive = false;
        end;
        return;
    end;
end;
local l_realtime_0 = globals.realtime;
local l_realtime_1 = globals.realtime;
events.bullet_impact:set(function(v441)
    -- upvalues: l_realtime_1 (ref), v317 (ref), l_realtime_0 (ref), v326 (ref)
    local v442 = entity.get_local_player();
    if not v442 then
        return;
    elseif not v442:is_alive() then
        return;
    else
        local v443 = entity.get(v441.userid, true);
        if not v443:is_enemy() then
            return;
        elseif entity.get_threat(true) == nil then
            return;
        else
            local v444 = (vector(v441.x, v441.y, v441.z) - v443:get_hitbox_position(0)):angles();
            local v445 = (v442:get_hitbox_position(3) - v443:get_hitbox_position(0)):angles() - v444;
            v445.y = math.clamp(v445.y, -180, 180);
            if math.sqrt(v445.y * v445.y + v445.x * v445.x) < 10 and l_realtime_1 + 0.1 < globals.realtime then
                v317[2] = v317[2] + 1;
                l_realtime_0 = globals.realtime;
                l_realtime_1 = globals.realtime + 0.1;
                if v326.misc.rage_logs:get() and v326.misc.rage_logs_type:get(3) then
                    render.notify("\aBAC4F9F7" .. ui.get_icon("moon-stars") .. "  \aFFFFFFFF" .. v443:get_name() .. " shot at you", color(v326.misc.rage_logs_hit:get().r, v326.misc.rage_logs_hit:get().g, v326.misc.rage_logs_hit:get().b, 255));
                end;
            end;
            return;
        end;
    end;
end);
ffi.cdef("    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder;\n        int m_nSequence;\n        float m_flPrevCycle;\n        float m_flWeight;\n        float m_flWeightDeltaRate;\n        float m_flPlaybackRate;\n        float m_flCycle;\n        void *m_pOwner;\n        char  pad_0038[4];\n    } animstate_layer_t;\n");
local _ = ffi.typeof("uintptr_t**");
local v447 = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)");
local v448 = 0;
local v449 = 0;
local function v451()
    -- upvalues: v448 (ref), v449 (ref)
    local v450 = entity.get_local_player();
    if not v450 then
        return;
    else
        if bit.band(v450.m_fFlags, 1) == 1 then
            v448 = v448 + 1;
        else
            v448 = 0;
            v449 = globals.curtime + 1;
        end;
        return v448 > 1 and v449 > globals.curtime;
    end;
end;
local v452 = false;
local function v457(v453)
    -- upvalues: v452 (ref), v447 (ref), v326 (ref), v324 (ref), v451 (ref)
    v452 = false;
    v453 = entity.get_local_player();
    if v453 == nil then
        return;
    elseif not v453:is_alive() then
        return;
    elseif v453:get_index() == nil then
        return;
    else
        local v454 = v447(v453:get_index());
        local v455 = v453.m_vecVelocity:length() > 5;
        local _ = bit.band(v453.m_fFlags, 1) == 0;
        if not v326.antiaim.anim_breakers:get() then
            return;
        else
            if v326.antiaim.anim_ground:get() == "Static" then
                v453.m_flPoseParameter[0] = 1;
                v324.legmovement:override("Sliding");
            elseif v326.antiaim.anim_ground:get() == "Sliding" then
                v453.m_flPoseParameter[10] = 0;
                v324.legmovement:override("Walking");
            elseif v326.antiaim.anim_ground:get() == "Moonwalk" then
                v453.m_flPoseParameter[10] = 1;
                v324.legmovement:override("Walking");
            elseif v326.antiaim.anim_ground:get() == "Jitter" then
                v453.m_flPoseParameter[0] = globals.tickcount % 4 > 1 and v326.antiaim.anim_jitter:get() / 100 or 1;
                v452 = true;
                v324.legmovement:override(globals.tickcount % 8 > 3 and "Walking" or "Sliding");
            elseif v326.antiaim.anim_ground:get() == "Better Jitter" then
                v453.m_flPoseParameter[0] = math.random(v326.antiaim.anim_jitter:get() / 10, 10) / 10;
                v324.legmovement:override(globals.tickcount % 8 > 3 and "Walking" or "Sliding");
                v452 = true;
            end;
            if v326.antiaim.anim_air:get() == "Static" then
                v453.m_flPoseParameter[6] = 1;
            elseif v326.antiaim.anim_air:get() == "Moonwalk" then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v454) + 10640)[0][6].m_flWeight = 1;
            elseif v326.antiaim.anim_air:get() == "Jitter" then
                v453.m_flPoseParameter[6] = globals.tickcount % 4 > 1 and v326.antiaim.anim_air_jitter:get() / 100 or 0;
            elseif v326.antiaim.anim_air:get() == "Better Jitter" then
                v453.m_flPoseParameter[3] = math.random(0, v326.antiaim.anim_jitter:get() / 10) / 10;
                v453.m_flPoseParameter[6] = math.random(0, v326.antiaim.anim_jitter:get() / 10) / 10;
                v452 = true;
            elseif v326.antiaim.anim_air:get() == "Flying" then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v454) + 10640)[0][5].m_flWeight = 1;
            end;
            if v326.antiaim.anim_other:get("Zero Pitch On Land") and v451() then
                v453.m_flPoseParameter[12] = 0.5;
            end;
            if v326.antiaim.anim_other:get("Move Lean") and not v326.antiaim.anim_other:get("EarthQuake") and v455 then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v454) + 10640)[0][12].m_flWeight = v326.antiaim.anim_lean:get() / 100;
            end;
            if v326.antiaim.anim_other:get("Static") then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v454) + 10640)[0][7].m_flWeight = 1;
            end;
            if v326.antiaim.anim_other:get("EarthQuake") then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v454) + 10640)[0][12].m_flWeight = math.random(0, 100) / 100;
                v452 = true;
            end;
            return;
        end;
    end;
end;
events.post_update_clientside_animation:set(v457);
local function v460()
    -- upvalues: l_gradient_0 (ref), l_pui_0 (ref)
    local v458 = l_gradient_0.text_animate("G E N E S I S", -1, {
        color(200, 200, 200, 240), 
        color(150, 150, 150, 200), 
        color(100, 100, 100, 160)
    });
    local v459 = l_gradient_0.text_animate(ui.get_icon("star") .. " " .. ui.get_icon("star") .. " " .. ui.get_icon("star"), -1, {
        color(200, 200, 200, 240), 
        color(150, 150, 150, 200), 
        color(100, 100, 100, 160)
    });
    v458:animate();
    v459:animate();
    if ui.get_alpha() > 0 then
        l_pui_0.sidebar(v458:get_animated_text(), "\a969696FF" .. ui.get_icon("code"));
    end;
    render.text(4, vector(render.screen_size().x * 0.5, render.screen_size().y - 10), color(255), "c", v458:get_animated_text());
    render.text(4, vector(render.screen_size().x * 0.5, render.screen_size().y - 20), color(255), "c", v459:get_animated_text());
end;
local v461 = render.screen_size() / 2;
local v462 = {};
local function v476()
    -- upvalues: v462 (ref), v326 (ref), v461 (ref)
    for v463, v464 in pairs(v462) do
        if v464.FadeTime <= 0 then
            v462[v463] = nil;
        else
            v464.WaitTime = v464.WaitTime - globals.frametime;
            if v464.WaitTime <= 0 then
                v464.FadeTime = v464.FadeTime - 2 * globals.frametime;
            end;
            if v326.visuals.world_hitmarker:get() and v464.Position.x ~= nil and v464.Position.y ~= nil and v464.Position.z ~= nil and v464.Reason == nil then
                local v465 = render.world_to_screen(vector(v464.Position.x, v464.Position.y, v464.Position.z));
                if v465 ~= nil then
                    local l_x_0 = v465.x;
                    local l_y_0 = v465.y;
                    local v468 = v461 * 2;
                    local v469, v470, v471, v472 = v326.visuals.world_hitmarker_clr:get():unpack();
                    render.rect(vector(l_x_0 - 0.5 / v468.x * v468.x, l_y_0 - 6 / v468.y * v468.y), vector(l_x_0 + 0.5 / v468.x * v468.x, l_y_0 + 6 / v468.y * v468.y), color(v469, v470, v471, v472 * v464.FadeTime), 0, true);
                    render.rect(vector(l_x_0 - 6 / v468.x * v468.x, l_y_0 - 0.5 / v468.y * v468.y), vector(l_x_0 + 6 / v468.x * v468.x, l_y_0 + 0.5 / v468.y * v468.y), color(v469, v470, v471, v472 * v464.FadeTime), 0, true);
                end;
            end;
            if v326.visuals.world_missmarker:get() and v464.Position.x ~= nil and v464.Position.y ~= nil and v464.Position.z ~= nil and v464.Reason ~= nil then
                local v473 = render.world_to_screen(vector(v464.Position.x, v464.Position.y, v464.Position.z));
                if not v473 then
                    return;
                else
                    local v474 = render.measure_text(1, "", "x   ");
                    local v475 = render.measure_text(1, "", v464.Reason);
                    render.shadow(vector(v473.x + v474.x, v473.y + v474.y / 2), vector(v473.x + v474.x + v475.x, v473.y + v474.y / 2), v326.visuals.world_missmarker_clr:get(), 30, 0, 3);
                    render.text(1, vector(v473.x, v473.y), color(255), "", "x   " .. v464.Reason);
                end;
            end;
        end;
    end;
end;
local v477 = {};
local function v482()
    -- upvalues: v461 (ref), v477 (ref), v326 (ref)
    local v478 = 0;
    local v479 = v461.y * 1.3;
    for v480, v481 in ipairs(v477) do
        v481[2] = globals.curtime - v481[3] < 4 and (not (#v477 > 5) or v480 >= #v477 - 5) and math.lerp(v481[2], 255, 20) or math.lerp(v481[2], 0, 20);
        v478 = v478 - 40 * (v481[2] / 255);
        text_size = render.measure_text(1, "od", v481[1]);
        if v326.misc.rage_logs_style:get() == 1 then
            render.shadow(vector(v461.x - text_size.x / 2, v479 - v478 + 6), vector(v461.x + text_size.x / 2, v479 - v478 + 6), color(v481[4].r, v481[4].g, v481[4].b, v481[2]), 30, 0, 0);
        else
            render.shadow(vector(v461.x - text_size.x / 2 - 10, v479 - v478 - 5), vector(v461.x + text_size.x / 2 + 10, v479 - v478 + text_size.y + 5), color(v481[4].r, v481[4].g, v481[4].b, v481[2]), 30, 0, v326.misc.rage_logs_round:get());
            render.rect(vector(v461.x - text_size.x / 2 - 10, v479 - v478 - 5), vector(v461.x + text_size.x / 2 + 10, v479 - v478 + text_size.y + 5), color(20, 20, 20, v481[2]), v326.misc.rage_logs_round:get());
        end;
        render.text(1, vector(v461.x - text_size.x / 2, v479 - v478), color(255, 255, 255, v481[2] / 255 * 255), "od", v481[1]);
        if v481[2] < 0.1 or not entity.get_local_player() then
            table.remove(v477, v480);
        end;
    end;
end;
render.notify = function(v483, v484)
    -- upvalues: v477 (ref)
    table.insert(v477, {
        [1] = nil, 
        [2] = 0, 
        [1] = v483, 
        [3] = globals.curtime, 
        [4] = v484
    });
end;
render.notify("\aBAC4F9F7" .. ui.get_icon("moon-stars") .. "\aFFFFFFFF Welcome back, \aBAC4F9F7" .. common.get_username(), color(v326.misc.rage_logs_hit:get().r, v326.misc.rage_logs_hit:get().g, v326.misc.rage_logs_hit:get().b, 255));
local v485 = {
    [0] = "generic", 
    [1] = "head", 
    [2] = "chest", 
    [3] = "stomach", 
    [4] = "left arm", 
    [5] = "right arm", 
    [6] = "left leg", 
    [7] = "right leg", 
    [8] = "neck", 
    [9] = "generic", 
    [10] = "gear"
};
events.aim_ack:set(function(v486)
    -- upvalues: v462 (ref), v326 (ref), v485 (ref), v317 (ref)
    local v487 = entity.get(v486.target);
    if not v487 then
        return;
    else
        v462[v486.id] = {
            WaitTime = 2, 
            FadeTime = 1, 
            Position = v486.aim, 
            Reason = v486.state
        };
        if v486.state == nil then
            local v488 = color(v326.misc.rage_logs_hit:get().r, v326.misc.rage_logs_hit:get().g, v326.misc.rage_logs_hit:get().b, 255);
            local v489 = v488:to_hex();
            local v490 = ("\aBAC4F9F7[genesis] \aBAC4F9F7\194\187\aFFFFFFFF Registered shot in \aBAC4F9F7%s\aFFFFFFFF %s for\aBAC4F9F7 %d damage\aFFFFFFFF (hitchance: %d%% | safety: 1 | history(\206\148): \aBAC4F9F7%d\aFFFFFFFF)"):format(v487:get_name(), v485[v486.hitgroup], v486.damage, v486.hitchance, v486.backtrack);
            local v491 = ("\a" .. v489 .. "" .. ui.get_icon("moon-stars") .. " \aFFFFFFFFHit \a" .. v489 .. "%s's \aFFFFFFFF%s (%d%%) for \a" .. v489 .. "%d \aFFFFFFFFdmg"):format(v487:get_name(), v485[v486.hitgroup], v486.hitchance, v486.damage);
            if v326.misc.rage_logs:get() and v326.misc.rage_logs_type:get("Screen") then
                render.notify(v491, v488);
            end;
            if v326.misc.rage_logs:get() and v326.misc.rage_logs_type:get("Event") then
                common.add_event(v490, "moon-stars");
            end;
            if v326.misc.rage_logs:get() and v326.misc.rage_logs_type:get("Console") then
                print_raw(v490);
            end;
            if v487.m_iHealth < 1 then
                v317[1] = v317[1] + 1;
            end;
        else
            local v492 = color(v326.misc.rage_logs_miss:get().r, v326.misc.rage_logs_miss:get().g, v326.misc.rage_logs_miss:get().b, 255);
            local v493 = v492:to_hex();
            local v494 = ("\aBAC4F9F7[genesis] \aFFFFFFFF\194\187\aFFFFFFFF Missed shot at \aBA5A5AFF%s\aFFFFFFFF %s(%d%%) due to\aBA5A5AFF \aFFFFFFFF%s \aBA5A5AFFdmg: %d \aFFFFFFFFsafety: 1\aFFFFFFFF \aFFFFFFFF& history(\206\148):\aBA5A5AFF%d\aFFFFFFFF)"):format(v487:get_name(), v485[v486.wanted_hitgroup], v486.hitchance, v486.state, v486.wanted_damage, v486.backtrack);
            local v495 = ("\a" .. v493 .. "" .. ui.get_icon("moon-stars") .. " \aFFFFFFFFMissed \a" .. v493 .. "%s's \aFFFFFFFF%s (%d%%) due to \a" .. v493 .. "%s"):format(v487:get_name(), v485[v486.wanted_hitgroup], v486.hitchance, v486.state);
            if v326.misc.rage_logs:get() and v326.misc.rage_logs_type:get("Screen") then
                render.notify(v495, v492);
            end;
            if v326.misc.rage_logs:get() and v326.misc.rage_logs_type:get("Event") then
                common.add_event(v494, "moon-stars");
            end;
            if v326.misc.rage_logs:get() and v326.misc.rage_logs_type:get("Console") then
                print_raw(v494);
            end;
        end;
        return;
    end;
end);
local v496 = 0;
local v497 = 0;
local function v505()
    -- upvalues: v461 (ref), v326 (ref), v303 (ref), v297 (ref), v302 (ref), v496 (ref), v497 (ref)
    local l_x_1 = v461.x;
    local l_y_1 = v461.y;
    local v500 = entity.get_local_player();
    if not v500 then
        return;
    elseif not v500:is_alive() then
        return;
    else
        local l_m_bIsScoped_0 = v500.m_bIsScoped;
        local v502 = v326.visuals.custom_scope_offset:get();
        v303.custom_scope_offset = v297.new(0.1, v302, {
            custom_scope_offset = l_m_bIsScoped_0 and 1 or 0
        }, "linear");
        v496 = v326.visuals.custom_scope_length:get() * v302.custom_scope_offset;
        v497 = v302.custom_scope_offset * v326.visuals.custom_scope_color:get().a;
        local v503 = v326.visuals.custom_scope_inverted:get() and color(v326.visuals.custom_scope_color:get().r, v326.visuals.custom_scope_color:get().g, v326.visuals.custom_scope_color:get().b, 1) or color(v326.visuals.custom_scope_color:get().r, v326.visuals.custom_scope_color:get().g, v326.visuals.custom_scope_color:get().b, v497);
        local v504 = v326.visuals.custom_scope_inverted:get() and color(v326.visuals.custom_scope_color:get().r, v326.visuals.custom_scope_color:get().g, v326.visuals.custom_scope_color:get().b, v497) or color(v326.visuals.custom_scope_color:get().r, v326.visuals.custom_scope_color:get().g, v326.visuals.custom_scope_color:get().b, 1);
        if v496 > 1 and l_m_bIsScoped_0 then
            render.gradient(vector(l_x_1, l_y_1 + v502), vector(l_x_1 + 1, l_y_1 + v496 + v502), v503, v503, v504, v504);
            render.gradient(vector(l_x_1 + v496 + v502, l_y_1), vector(l_x_1 + v502, l_y_1 + 1), v504, v503, v504, v503);
            if not v326.visuals.custom_scope_t:get() then
                render.gradient(vector(l_x_1, l_y_1 - (v502 - 1) - v496), vector(l_x_1 + 1, l_y_1 - (v502 - 1)), v504, v504, v503, v503);
            end;
            render.gradient(vector(l_x_1 - v496 - (v502 - 1), l_y_1), vector(l_x_1 - (v502 - 1), l_y_1 + 1), v504, v503, v504, v503);
        end;
        return;
    end;
end;
render.defuse_bar = function(v506, v507)
    local v508 = 0;
    local l_y_2 = render.screen_size().y;
    render.rect(vector(v508, 0), vector(18, l_y_2), color(0, 0, 0, 45));
    render.rect(vector(v508, l_y_2 * (1 - v506)), vector(18, l_y_2), v507);
end;
render.indicator = function(v510, v511, v512, v513, v514, v515, v516)
    -- upvalues: v305 (ref), v304 (ref)
    local v517 = 30;
    local v518 = render.screen_size().y - 325;
    local v519 = nil;
    if v513 then
        v519 = render.measure_text(v305, "", v510);
        v519.x = v519.x + 35;
    else
        v519 = render.measure_text(v305, "", v510);
    end;
    render.gradient(vector(v517 - 20, v518 + v512 - 8), vector(v517 + v519.x / 2, v518 + v512 + v519.y + 5), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45));
    render.gradient(vector(v517 + v519.x / 2, v518 + v512 - 8), vector(v517 + 20 + v519.x, v518 + v512 + v519.y + 5), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0));
    if v513 then
        render.texture(v304, vector(v517, v518 + v512 - 6), vector(30, 30), v514);
        render.text(v305, vector(v517 + 35, v518 + v512), v511, "", v510);
    else
        render.text(v305, vector(v517, v518 + v512), v511, "", v510);
    end;
    if v515 and v516 then
        render.circle_outline(vector(v517 + v519.x + 18, v518 + v512 + v519.y / 2 - 2), color(0, 0, 0, 200), 10, 0, 360, 4);
        render.circle_outline(vector(v517 + v519.x + 18, v518 + v512 + v519.y / 2 - 2), v515, 10, 0, v516, 4);
    end;
end;
local v520 = {
    bomb_timer = 0, 
    defuse_time = 0, 
    damage = 0, 
    planting_site = "", 
    fill = 0, 
    on_plant_time = 0, 
    killed = false, 
    planting = false, 
    can_defuse = false
};
reset_bomb = function()
    -- upvalues: v520 (ref)
    v520.can_defuse = false;
    v520.planting = false;
    v520.killed = false;
    v520.on_plant_time = 0;
    v520.fill = 0;
    v520.planting_site = "";
    v520.damage = 0;
    v520.bomb_timer = 0;
    v520.defuse_time = 0;
end;
render.window_bomb = function(v521, v522, v523, v524, v525, v526, v527, v528, v529, _, v531)
    -- upvalues: v326 (ref), v306 (ref), v520 (ref), v304 (ref)
    if not entity.get_local_player() then
        return;
    else
        local v532 = v326.visuals.solus_ui_color:get();
        local l_r_0 = v532.r;
        local l_g_0 = v532.g;
        local l_b_0 = v532.b;
        local v536 = color(l_r_0, l_g_0, l_b_0, v525):to_hex();
        local v537 = render.measure_text(v306, "a", "Bombsite: " .. v526);
        render.shadow(vector(v521, v522), vector(v521 + v523 + 3, v522 + 19 + v524), color(l_r_0, l_g_0, l_b_0, v525), 20, 0, 3);
        render.rect(vector(v521, v522), vector(v521 + v523 + 3, v522 + 19 + v524), color(20, 20, 20, v525), 3);
        render.text(v306, vector(v521 + 40, v522 + 5), color(200, 200, 200, v525), "a", "Bombsite: \a" .. v536 .. v526);
        render.text(v306, vector(v521 + 40, v522 + 10 + v537.y), color(200, 200, 200, v525), "a", v520.killed and "Damage: \aFF0000FF" .. v527 or "Damage: \a" .. v536 .. v527);
        render.texture(v304, vector(v521 + 5, v522 + 5), vector(30, 30), color(l_r_0, l_g_0, l_b_0, v525));
        render.circle_outline(vector(v521 + 131, v522 + 20), color(100, 100, 100, v525), 15, 0, 360, 2);
        if v528 and v528 ~= 0 then
            local v538 = math.max(0, math.min(1, v528 / 40));
            local v539 = math.floor(v528 * 10);
            render.text(1, vector(v521 + 132, v522 + 19), color(200, 200, 200, v525), "cao", v539 / 10);
            render.circle_outline(vector(v521 + 131, v522 + 20), color(l_r_0, l_g_0, l_b_0, v525), 15, 270, v538, 2);
        end;
        if v529 and v529 ~= 0 then
            local v540 = math.max(0, math.min(1, v529 / 10));
            local v541 = math.floor(v529 * 10);
            render.text(1, vector(v521 + 132, v522 + 19), v520.can_defuse and color(138, 226, 92, v525) or color(255, 0, 0, v525), "cao", v541 / 10);
            render.circle_outline(vector(v521 + 131, v522 + 20), color(l_r_0, l_g_0, l_b_0, v525), 15, 270, v540, 2);
        end;
        if v531 and v531 ~= 0 then
            local v542 = math.max(0, math.min(1, v531 / 3.125));
            local v543 = math.floor(v531 * 10);
            render.text(1, vector(v521 + 132, v522 + 19), color(138, 226, 92, v525), "cao", v543 / 10);
            render.circle_outline(vector(v521 + 131, v522 + 20), color(l_r_0, l_g_0, l_b_0, v525), 15, 270, v542, 2);
        end;
        return;
    end;
end;
local l_x_2 = render.screen_size().x;
local l_y_3 = render.screen_size().y;
local v546 = 0;
local v547 = 1;
local _ = 0;
local v549 = 0;
local v550 = {
    [""] = {
        alphak = 0
    }
};
local _ = 1;
local v552 = 255;
local v553 = v325.selector:slider("winx", 0, l_x_2, 400);
local v554 = v325.selector:slider("winy", 0, l_y_3, 400);
local v555 = v325.selector:slider("winx1", 0, l_x_2, 300);
local v556 = v325.selector:slider("winy1", 0, l_y_3, 300);
local v557 = v325.selector:slider("winx2", 0, l_x_2, l_x_2 / 2 - 65);
local v558 = v325.selector:slider("winy2", 0, l_y_3, l_y_3 / 3);
local v559 = v325.selector:slider("velx", 0, l_x_2, l_x_2 / 2 - 50);
local v560 = v325.selector:slider("vely", 0, l_y_3, l_y_3 / 5);
local v561 = v325.selector:slider("defx", 0, l_x_2, l_x_2 / 2 - 50);
local v562 = v325.selector:slider("defy", 0, l_y_3, l_y_3 / 4);
local v563 = v325.selector:slider("dmgx", 0, l_x_2, l_x_2 / 2 + 5);
local v564 = v325.selector:slider("dmgy", 0, l_y_3, l_y_3 / 2 - 15);
v553:visibility(false);
v554:visibility(false);
v555:visibility(false);
v556:visibility(false);
v557:visibility(false);
v558:visibility(false);
v559:visibility(false);
v560:visibility(false);
v561:visibility(false);
v562:visibility(false);
v563:visibility(false);
v564:visibility(false);
render.solus = function(v565, v566, v567, v568, v569, v570)
    -- upvalues: v326 (ref)
    if not entity.get_local_player() then
        return;
    else
        local v571 = render.measure_text(1, "", v569);
        local v572 = render.measure_text(1, "", ui.get_icon("moon-stars") .. " " .. v569);
        local v573 = v326.visuals.solus_ui_color:get();
        local l_r_1 = v573.r;
        local l_g_1 = v573.g;
        local l_b_1 = v573.b;
        if v326.visuals.solus_ui_type:get() == 1 then
            render.rect(vector(v565, v566), vector(v565 + v567 + 3, v566 + 19), color(0, 0, 0, v570 / 4));
            render.rect(vector(v565, v566), vector(v565 + v567 + 3, v566 + 2), color(l_r_1, l_g_1, l_b_1, v570));
            render.text(1, vector(v565 + 3 + v567 / 2 + 1 - v571.x / 2, v566 + 1 + v568 / 2 - v571.y / 2), color(255, 255, 255, v570), "", v569);
        elseif v326.visuals.solus_ui_type:get() == 2 then
            render.rect(vector(v565, v566), vector(v565 + v567 + 3, v566 + 19), color(0, 0, 0, v570 / 4), 4);
            render.rect_outline(vector(v565, v566), vector(v565 + v567 + 3, v566 + 19), color(l_r_1, l_g_1, l_b_1, v570 / 2), 1, 4);
            render.text(1, vector(v565 + 3 + v567 / 2 + 1 - v571.x / 2, v566 + 1 + v568 / 2 - v571.y / 2), color(255, 255, 255, v570), "", v569);
        elseif v326.visuals.solus_ui_type:get() == 3 then
            render.rect(vector(v565 - 5, v566 - 4), vector(v565 + v567 + 7, v566 + 21), color(40, 40, 40, v570), 0);
            render.rect_outline(vector(v565 - 4, v566 - 3), vector(v565 + v567 + 6, v566 + 20), color(0, 0, 0, v570 / 2), 0);
            render.rect(vector(v565, v566 + 1), vector(v565 + v567 + 3, v566 + 17), color(20, 20, 20, v570), 0);
            render.rect_outline(vector(v565 - 1, v566), vector(v565 + v567 + 3, v566 + 18), color(60, 60, 60, v570), 0);
            render.gradient(vector(v565, v566 + 1), vector(v565 + v567 / 2, v566 + 2), color(78, 169, 249, v570), color(254, 86, 217, v570), color(78, 169, 249, v570), color(254, 86, 217, v570));
            render.gradient(vector(v565 + v567 / 2, v566 + 1), vector(v565 + v567 + 2, v566 + 2), color(254, 86, 217, v570), color(214, 255, 108, v570), color(254, 86, 217, v570), color(214, 255, 108, v570));
            render.text(1, vector(v565 + 3 + v567 / 2 + 1 - v571.x / 2, v566 + 1 + v568 / 2 - v571.y / 2), color(255, 255, 255, v570), "", v569);
        elseif v326.visuals.solus_ui_type:get() == 4 then
            render.shadow(vector(v565, v566), vector(v565 + v567 + 3, v566 + 19), color(l_r_1, l_g_1, l_b_1, v570), 20, 0, v326.visuals.solus_ui_round:get());
            render.rect(vector(v565, v566), vector(v565 + v567 + 3, v566 + 19), color(20, 20, 20, v570), v326.visuals.solus_ui_round:get());
            render.text(1, vector(v565 + 3 + v567 / 2 + 1 - v572.x / 2, v566 + 1 + v568 / 2 - v572.y / 2), color(255, 255, 255, v570), "", "\a" .. v573:to_hex() .. ui.get_icon("moon-stars") .. "\aFFFFFFFF " .. v569);
        end;
        return;
    end;
end;
render.window = function(v577, v578, v579, v580, v581, v582, v583, v584, v585)
    if v583 < 10 then
        return;
    else
        local v586 = render.measure_text(1, nil, v584);
        render.text(1, vector(v577 + 50 - v586.x / 2, v578 - 20), color(255, 255, 255, v583), nil, v584);
        if v585 == "Default" then
            render.rect(vector(v577, v578), vector(v579 + 100, v580), color(0, 0, 0, v583));
            render.rect(vector(v577 + 1, v578 + 1), vector(v579 - 1 + v581, v580 - 1), color(v582.r, v582.g, v582.b, v583));
        elseif v585 == "Modern" then
            render.gradient(vector(v577 - v581 / 2 + 50, v578), vector(v577 + 50, v578 + 2), color(v582.r, v582.g, v582.b, v583), color(v582.r, v582.g, v582.b, v583), color(v582.r, v582.g, v582.b, v583 / 4), color(v582.r, v582.g, v582.b, v583), true);
            render.gradient(vector(v577 + 50, v578), vector(v577 + 50 + v581 / 2, v578 + 2), color(v582.r, v582.g, v582.b, v583), color(v582.r, v582.g, v582.b, v583), color(v582.r, v582.g, v582.b, v583), color(v582.r, v582.g, v582.b, v583 / 4), true);
        else
            render.rect(vector(v577 - v581 / 2 + 50, v578), vector(v579 + 50 + v581 / 2, v580 + 1), color(v582.r, v582.g, v582.b, v583), 5);
            render.shadow(vector(v577 - v581 / 2 + 50, v578), vector(v579 + 50 + v581 / 2, v580 + 1), color(255, 255, 255, v583), 30, 0, 5);
        end;
        return;
    end;
end;
local v587 = 0;
local v588 = 0;
local v589 = 100;
local v590 = 100;
local v593 = l_system_0.register({
    [1] = v561, 
    [2] = v562
}, vector(100, 20), "Defensive", function(v591)
    -- upvalues: v589 (ref), v587 (ref), v324 (ref), v326 (ref)
    local v592 = entity.get_local_player();
    if not v592 then
        return;
    elseif not v592:is_alive() then
        return;
    else
        if ui.get_alpha() > 0 then
            v589 = globals.tickcount % 50 * 2;
        elseif rage.exploit:get() == 1 and is_defensive_active(v592) then
            v589 = math.lerp(v589, 100, 20);
        elseif rage.exploit:get() == 1 then
            v589 = math.lerp(v589, 50, 20);
        else
            v589 = math.lerp(v589, 0, 20);
        end;
        if ui.get_alpha() == 1 then
            v587 = math.lerp(v587, 255, 20);
        elseif v324.fakeduck:get() then
            v587 = math.lerp(v587, 0, 20);
        else
            v587 = math.lerp(v587, ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() and 255 or 0, 20);
        end;
        render.window(v591.position.x, v591.position.y + 20, v591.position.x, v591.position.y + 24, v589, v326.visuals.windows_defensive_clr:get(), v587, "- defensive -", v326.visuals.windows_defensive:get());
        return;
    end;
end);
local v596 = l_system_0.register({
    [1] = v559, 
    [2] = v560
}, vector(100, 20), "Velocity", function(v594)
    -- upvalues: v590 (ref), v588 (ref), v326 (ref)
    local v595 = entity.get_local_player();
    if not v595 then
        return;
    elseif not v595:is_alive() then
        return;
    else
        if ui.get_alpha() > 0 then
            v590 = globals.tickcount % 50 * 2;
        else
            v590 = v595.m_flVelocityModifier * 100;
        end;
        v588 = math.lerp(v588, (not (v590 == 100) or ui.get_alpha() ~= 0) and 255 or 0, 20);
        render.window(v594.position.x, v594.position.y + 20, v594.position.x, v594.position.y + 24, v590, v326.visuals.windows_slowed_clr:get(), v588, "- velocity -", v326.visuals.windows_slowed:get());
        return;
    end;
end);
local function v601()
    -- upvalues: v326 (ref), l_x_2 (ref)
    local v597 = common.get_date("%H:%M:%S");
    local v598 = globals.is_in_game and " | " .. math.floor(utils.net_channel().avg_latency[0]) .. "ms" or "";
    local v599 = "genesis | " .. v326.visuals.solus_ui_name:get() .. v598 .. " | " .. v597 .. " ";
    local v600 = nil;
    if v326.visuals.solus_ui_type:get() == 4 then
        v600 = render.measure_text(1, "", ui.get_icon("moon-stars") .. " " .. v599).x;
    else
        v600 = render.measure_text(1, "", v599).x;
    end;
    render.solus(l_x_2 - v600 - 19, 10, v600 + 4, 16, v599, 400);
end;
lerpx = function(v602, v603, v604)
    return v603 * (1 - v602) + v604 * v602;
end;
local v619 = l_system_0.register({
    [1] = v553, 
    [2] = v554
}, vector(130, 50), "Keybind", function(v605)
    -- upvalues: v550 (ref), v549 (ref), v547 (ref), v546 (ref)
    local v606 = 120;
    local _ = globals.frametime * 16;
    local v608 = 0;
    local v609 = {};
    local v610 = ui.get_binds();
    for v611 = 1, #v610 do
        local v612 = v610[v611];
        local v613 = v612.mode == 1 and "hold" or v612.mode == 2 and "toggle" or "[?]";
        local _ = v612.value;
        local l_name_0 = v612.name;
        local v616 = render.measure_text(1, "", v613);
        local v617 = render.measure_text(1, "", l_name_0);
        if v550[l_name_0] == nil then
            v550[l_name_0] = {
                alphak = 0
            };
        end;
        v550[l_name_0].alphak = math.lerp(v550[l_name_0].alphak, v612.active and 255 or 0, 20);
        render.text(1, vector(v605.position.x + 3, v605.position.y + 22 + v608), color(255, v550[l_name_0].alphak), "", l_name_0);
        render.text(1, vector(v605.position.x + (v549 - v616.x - 8), v605.position.y + 22 + v608), color(255, v550[l_name_0].alphak), "", "[" .. v613 .. "]");
        v608 = v608 + 16 * v550[l_name_0].alphak / 255;
        local v618 = v616.x + v617.x + 18;
        if v618 > 119 and v606 < v618 then
            v606 = v618;
        end;
    end;
    v547 = math.lerp(v547, (not (ui.get_alpha() <= 0) or v608 > 0) and 1 or 0, 20);
    v549 = math.lerp(v549, math.max(v606, 119), 20);
    if ui.get_alpha() > 0 or v608 > 6 then
        v546 = math.lerp(v546, math.max(ui.get_alpha() * 255, v608 > 1 and 255 or 0), 20);
    elseif v608 < 15.99 and ui.get_alpha() == 0 then
        v546 = math.lerp(v546, 0, 20);
    end;
    if ui.get_alpha() or #v609 > 0 then
        render.solus(v605.position.x, v605.position.y, v549, 16, "keybinds", v546);
    end;
end);
local v629 = l_system_0.register({
    [1] = v555, 
    [2] = v556
}, vector(130, 50), "Spectator", function(v620)
    -- upvalues: v552 (ref)
    local v621 = 120;
    local v622 = entity.get_local_player();
    if v622 == nil then
        return;
    else
        local v623 = v622:get_spectators();
        if v623 == nil then
            return;
        else
            for v624, v625 in pairs(v623) do
                local v626 = v625:get_name();
                local _ = render.measure_text(1, "", v626).x;
                local v628 = string.len(v626) > 20 and string.sub(v626, 0, 20) .. "..." or v626;
                render.text(1, vector(v620.position.x + 10, v620.position.y + 5 + v624 * 15), color(), "u", v628);
            end;
            v552 = math.lerp(v552, (not (#v622:get_spectators() <= 0) or ui.get_alpha() > 0) and 255 or 0, 20);
            if v552 > 10 then
                render.solus(v620.position.x, v620.position.y, v621, 16, "spectators", v552);
            end;
            return;
        end;
    end;
end);
local v632 = l_system_0.register({
    [1] = v563, 
    [2] = v564
}, vector(20, 20), "Min.Damage", function(v630)
    -- upvalues: v326 (ref)
    local v631 = entity.get_local_player();
    if v631 == nil then
        return;
    elseif not v631:is_alive() then
        return;
    else
        if v326.visuals.damage_indicator_font:get() == "Default" then
            dmg_font = 1;
        elseif v326.visuals.damage_indicator_font:get() == "Small" then
            dmg_font = 2;
        elseif v326.visuals.damage_indicator_font:get() == "Bold" then
            dmg_font = 4;
        else
            dmg_font = 3;
        end;
        render.text(dmg_font, vector(v630.position.x, v630.position.y), color(255), "", ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get());
        return;
    end;
end);
render.spectators = function()
    local v633 = entity.get_local_player();
    if v633 == nil then
        return;
    else
        local v634 = v633:get_spectators();
        if v634 == nil then
            return;
        else
            local v635 = 0;
            for _, v637 in pairs(v634) do
                local v638 = v637:get_name();
                local _ = render.measure_text(1, "", v638).x;
                local v640 = string.len(v638) > 20 and string.sub(v638, 0, 20) .. "..." or v638;
                local v641 = render.measure_text(1, "u", v640);
                render.text(1, vector(render.screen_size().x - 15 - v641.x, 15 + v635), color(220), "u", v640);
                v635 = v635 + v641.y;
            end;
            return;
        end;
    end;
end;
local function v660()
    -- upvalues: v520 (ref)
    local v642 = entity.get_local_player();
    if v642 == nil then
        return;
    else
        local _ = render.screen_size() / 2;
        local v644 = entity.get_entities("CPlantedC4", true)[1];
        local _ = "";
        local v646 = 0;
        local v647 = false;
        local v648 = 0;
        local v649 = 0;
        if v644 ~= nil then
            v646 = v644.m_flC4Blow - globals.curtime;
            v647 = v644.m_bBombDefused;
            if v646 > 0 and not v647 then
                v520.planting = false;
                local v650 = v644.m_hBombDefuser ~= 4294967295;
                local l_m_flDefuseLength_0 = v644.m_flDefuseLength;
                local v652 = v650 and v644.m_flDefuseCountDown - globals.curtime or -1;
                v520.planting_site = v644.m_nBombSite == 0 and "A" or "B";
                local l_m_iHealth_0 = v642.m_iHealth;
                local l_m_ArmorValue_0 = v642.m_ArmorValue;
                local v655 = v644.m_vecOrigin:dist(v642.m_vecOrigin);
                local v656 = 450.7;
                local v657 = (v655 - 75.68) / 789.2;
                v648 = v656 * math.exp(-v657 * v657);
                if l_m_ArmorValue_0 > 0 then
                    local v658 = v648 * 0.5;
                    local v659 = (v648 - v658) * 0.5;
                    if l_m_ArmorValue_0 < v659 then
                        l_m_ArmorValue_0 = l_m_ArmorValue_0 * 2;
                        v658 = v648 - v659;
                    end;
                    v648 = v658;
                end;
                v649 = math.ceil(v648);
                v520.damage = v649;
                if l_m_iHealth_0 <= v649 then
                    v520.killed = true;
                else
                    v520.killed = false;
                end;
                v520.bomb_timer = v646;
                if v652 > 0 and l_m_flDefuseLength_0 and v644.m_hBombDefuser then
                    v520.can_defuse = v652 < v646;
                    v520.defuse_time = v652;
                else
                    v520.defuse_time = 0;
                    v520.can_defuse = false;
                end;
            end;
        elseif v520.planting then
            v520.fill = 3.125 - (3.125 + v520.on_plant_time - globals.curtime);
            if v520.fill > 3.125 then
                v520.fill = 3.125;
            end;
        else
            reset_bomb();
        end;
        return;
    end;
end;
local v661 = 0;
local v664 = l_system_0.register({
    [1] = v557, 
    [2] = v558
}, vector(130, 50), "Bomb Info", function(v662)
    -- upvalues: v520 (ref), v661 (ref)
    local v663 = v520.planting or v520.bomb_timer ~= 0 or v520.defuse_time ~= 0;
    v661 = math.lerp(v661, v663 and 255 or 0, 10);
    if v520.planting then
        render.window_bomb(v662.position.x, v662.position.y, 150, 20, v661, v520.planting_site, 0, nil, nil, nil, v520.fill);
    end;
    if v520.bomb_timer ~= 0 then
        render.window_bomb(v662.position.x, v662.position.y, 150, 20, v661, v520.planting_site, v520.damage, v520.bomb_timer, nil, nil, nil);
    end;
    if v520.defuse_time ~= 0 then
        render.window_bomb(v662.position.x, v662.position.y, 150, 20, v661, v520.planting_site, v520.damage, nil, v520.defuse_time, v520.can_defuse, nil);
    end;
    if v663 == false and ui.get_alpha() > 0 then
        render.window_bomb(v662.position.x, v662.position.y, 150, 20, 255 * ui.get_alpha(), "A", "0", math.floor(globals.tickcount % 82 / 2), nil, false, nil);
    end;
end);
bomb_beginplant = function(v665)
    -- upvalues: v520 (ref)
    local v666 = entity.get_player_resource();
    if v666 == nil then
        return;
    else
        v520.on_plant_time = globals.curtime;
        v520.planting = true;
        local l_m_bombsiteCenterA_0 = v666.m_bombsiteCenterA;
        local l_m_bombsiteCenterB_0 = v666.m_bombsiteCenterB;
        local v669 = entity.get(v665.userid, true):get_origin();
        v520.planting_site = v669:dist(l_m_bombsiteCenterA_0) < v669:dist(l_m_bombsiteCenterB_0) and "A" or "B";
        return;
    end;
end;
local function v677(v670, v671, v672, v673, v674, v675, v676)
    return (v673 - v670) * v676 + v670, (v674 - v671) * v676 + v671, (v675 - v672) * v676 + v672;
end;
local function v683(v678)
    local _ = 0;
    local v680 = 0;
    local v681 = 0;
    local v682 = {
        [1] = utils.net_channel(), 
        [2] = utils.net_channel()
    };
    if v678 ~= nil and v678:is_alive() then
        v682[1] = utils.net_channel();
        v682[2] = v682[1];
        if v682[1] then
            v680 = v682[1].sequence_nr[0];
            v681 = (v682[2].sequence_nr[1] + v680) / math.min(math.max(0.1, 0.001), 0.2);
            return math.clamp(-1.7014636E38, math.min(math.max(v681, 0), 1), v681);
        end;
    end;
end;
ui.get_currentbind = function(v684)
    local v685 = false;
    local v686 = 0;
    local v687 = ui.get_binds();
    for v688 = 1, #v687 do
        if v687[v688].name == v684 and v687[v688].active then
            v685 = true;
            v686 = v687[v688].value;
        end;
    end;
    return {
        [1] = v685, 
        [2] = v686
    };
end;
local v689 = 0;
local function v705()
    -- upvalues: v689 (ref), v677 (ref), v683 (ref), v326 (ref), v520 (ref)
    local v690 = entity.get_local_player();
    if v690 == nil then
        return;
    else
        local _ = ui.get_binds();
        local v692, v693, v694 = color(255, 255, 255):to_hsv();
        local v695, v696, v697 = color(151, 175, 54):to_hsv();
        v689 = 0;
        if v690:is_alive() then
            local v698 = color();
            local v699, v700, v701 = v677(v692, v693, v694, v695, v696, v697, v683(v690));
            v698:as_hsv(v699, v700, v701, 255);
            v699 = ui.get_currentbind("Hit Chance")[1];
            v700 = ui.get_currentbind("Min. Damage")[1];
            v701 = ui.get_currentbind("Body Aim")[1];
            local v702 = ui.get_currentbind("Safe Points")[1];
            if v326.misc.auto_teleport:get() then
                if not ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() and rage.exploit:get() < 1 then
                    render.indicator("+/- MAXIMIZING TELEPORT DISTANCE", color(200), v689);
                    v689 = v689 - 45;
                elseif rage.exploit:get() > 0 and rage.exploit:get() < 1 then
                    render.indicator("+/- MAXIMIZING TELEPORT DISTANCE", color(225, 0, 0, 255), v689);
                    v689 = v689 - 45;
                else
                    render.indicator("+/- MAXIMIZING TELEPORT DISTANCE", color(151, 175, 54, 255), v689);
                    v689 = v689 - 45;
                end;
            end;
            if v699 then
                render.indicator("H1TCHANCE", color(200), v689);
                v689 = v689 - 45;
            end;
            if ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):get() ~= 0 or v326.misc.fakeping:get() then
                render.indicator("PING", v698, v689);
                v689 = v689 - 45;
            end;
            if ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get() then
                render.indicator("DUCK", color(200), v689);
                v689 = v689 - 45;
            else
                if ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() then
                    render.indicator("DT", color(200, 200 * rage.exploit:get(), 200 * rage.exploit:get(), 255), v689);
                    v689 = v689 - 45;
                end;
                if ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() and not ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() then
                    render.indicator("OSAA", color(200, 200 * rage.exploit:get(), 200 * rage.exploit:get(), 255), v689);
                    v689 = v689 - 45;
                end;
            end;
            if ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"):get() or v326.misc.dormant_aimbot:get() then
                render.indicator("DA", color(200), v689);
                v689 = v689 - 45;
            end;
            if v702 then
                render.indicator("SAFE", color(200), v689);
                v689 = v689 - 45;
            end;
            if v701 then
                render.indicator("BODY", color(200), v689);
                v689 = v689 - 45;
            end;
            if v700 then
                render.indicator("MD", color(200), v689);
                v689 = v689 - 45;
            end;
            if ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get() or v326.antiaim.freestanding:get() then
                render.indicator("FS", color(200), v689);
                v689 = v689 - 45;
            end;
        end;
        if v520.planting then
            local v703 = math.max(0, math.min(1, v520.fill / 3.125));
            render.indicator(v520.planting_site, color(255, 255, 100), v689, true, color(255, 255, 100), color(200), v703);
            v689 = v689 - 45;
        end;
        if v520.bomb_timer ~= 0 then
            local v704 = math.floor(v520.bomb_timer * 10);
            render.indicator(v520.planting_site .. " - " .. v704 / 10 .. "s", color(200), v689, true, color(200));
            v689 = v689 - 45;
            if v690:is_alive() then
                if v520.killed then
                    render.indicator("FATAL", color(255, 30, 30), v689);
                    v689 = v689 - 45;
                elseif v520.damage > 1 then
                    render.indicator("-" .. math.floor(v520.damage) .. " HP", color(255, 255, 100), v689);
                    v689 = v689 - 45;
                end;
            end;
        end;
        if v520.defuse_time ~= 0 then
            render.defuse_bar(math.max(0, math.min(1, v520.defuse_time / 10)), v520.can_defuse and color(159, 202, 43) or color(255, 30, 30));
        end;
        return;
    end;
end;
local function v709(v706, v707)
    -- upvalues: v303 (ref), v297 (ref), v302 (ref)
    local _ = nil;
    if v707 == "dt" then
        v303.dt = v297.new(0.05, v302, {
            dt = v706 and 1 or 0
        }, "linear");
        return v302.dt;
    elseif v707 == "hs" then
        v303.hs = v297.new(0.05, v302, {
            hs = v706 and 1 or 0
        }, "linear");
        return v302.hs;
    elseif v707 == "fd" then
        v303.fd = v297.new(0.05, v302, {
            fd = v706 and 1 or 0
        }, "linear");
        return v302.fd;
    elseif v707 == "dmg" then
        v303.dmg = v297.new(0.05, v302, {
            dmg = v706 and 1 or 0
        }, "linear");
        return v302.dmg;
    else
        v303.fs = v297.new(0.05, v302, {
            fs = v706 and 1 or 0
        }, "linear");
        return v302.fs;
    end;
end;
local v710 = "share";
local v711 = false;
local function v724()
    -- upvalues: v397 (ref), v710 (ref), v711 (ref), v303 (ref), v297 (ref), v302 (ref), v461 (ref), v326 (ref), v709 (ref)
    local v712 = entity.get_local_player();
    if not v712 then
        return;
    else
        if v397 == 1 then
            v710 = "\195\151SHARE\195\151";
        elseif v397 == 2 then
            v710 = "\195\151STAND\195\151";
        elseif v397 == 3 then
            v710 = "\195\151RUN\195\151";
        elseif v397 == 4 then
            v710 = "\195\151WALK\195\151";
        elseif v397 == 5 then
            v710 = "\195\151DUCK\195\151";
        elseif v397 == 6 then
            v710 = "\195\151SNEAK\195\151";
        elseif v397 == 7 then
            v710 = "\195\151AIR\195\151";
        elseif v397 == 8 then
            v710 = "\195\151AIR+C\195\151";
        elseif v397 == 9 then
            v710 = "\195\151LAG\195\151";
        elseif v397 == 10 then
            v710 = "\195\151YAW\195\151";
        end;
        local v713 = v712:get_player_weapon();
        if v713 then
            local v714 = v713:get_classname();
            if v714 then
                v711 = string.match(v714, "Grenade");
            end;
        end;
        v303.scope_alpha = v297.new(0.1, v302, {
            scope_alpha = v711 and 0.5 or 1
        }, "linear");
        v303.alpha = v297.new(0.2, v302, {
            alpha = v712:is_alive() and 1 or 0
        }, "linear");
        local l_m_bIsScoped_1 = v712.m_bIsScoped;
        v303.scope_offset = v297.new(0.05, v302, {
            scope_offset = l_m_bIsScoped_1 and 105 or 0
        }, "linear");
        local v716 = math.min(v302.scope_offset, 100) / 100;
        local _ = math.min(v302.scope_offset, 50);
        local l_x_5 = render.measure_text(2, "", "GENESIS BETA").x;
        local l_x_6 = render.measure_text(2, "", v710).x;
        local l_x_7 = render.measure_text(2, "", "DT").x;
        local l_x_8 = render.measure_text(2, "", "DMG").x;
        local v722 = math.max(breathe(0, 2), 0.2) * 255 * v302.alpha * v302.scope_alpha;
        local v723 = 16;
        render.text(2, vector(v461.x + (l_x_5 + 15) / 2 * v716, v461.y + 30), color(255, 255, 255, 255 * v302.alpha * v302.scope_alpha), "c", "GENESIS\a" .. color(v326.visuals.crosshair_ind_color1:get().r, v326.visuals.crosshair_ind_color1:get().g, v326.visuals.crosshair_ind_color1:get().b, v722):to_hex() .. " BETA");
        render.text(2, vector(v461.x + (l_x_6 + 15) / 2 * v716, v461.y + 30 + 8), color(v326.visuals.crosshair_ind_color2:get().r, v326.visuals.crosshair_ind_color2:get().g, v326.visuals.crosshair_ind_color2:get().b, 255 * v302.alpha * v302.scope_alpha), "c", v710);
        render.text(2, vector(v461.x + (l_x_8 + 15) / 2 * v716, v461.y + 30 + v723), color(255, 255, 255, v709(ui.get_currentbind("Min. Damage")[1], "dmg") * 255 * v302.alpha * v302.scope_alpha), "c", "DMG");
        if ui.get_currentbind("Min. Damage")[1] then
            v723 = v723 + 8;
        end;
        render.text(2, vector(v461.x + (l_x_7 + 15) / 2 * v716, v461.y + 30 + v723), color(255, 255 * rage.exploit:get(), 255 * rage.exploit:get(), v709(ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get(), "dt") * 255 * v302.alpha * v302.scope_alpha), "c", "DT");
        if ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() then
            v723 = v723 + 8;
        end;
        render.text(2, vector(v461.x + (l_x_7 + 15) / 2 * v716, v461.y + 30 + v723), color(255, 255 * rage.exploit:get(), 255 * rage.exploit:get(), v709(ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get(), "hs") * 255 * v302.alpha * v302.scope_alpha), "c", "HS");
        if ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() then
            v723 = v723 + 8;
        end;
        render.text(2, vector(v461.x + (l_x_7 + 15) / 2 * v716, v461.y + 30 + v723), color(255, 255, 255, v709(ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get(), "fd") * 255 * v302.alpha * v302.scope_alpha), "c", "FD");
        if ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get() then
            v723 = v723 + 8;
        end;
        render.text(2, vector(v461.x + (l_x_7 + 15) / 2 * v716, v461.y + 30 + v723), color(255, 255, 255, v709(ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get(), "fs") * 255 * v302.alpha * v302.scope_alpha), "c", "FS");
        if ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get() then
            v723 = v723 + 8;
        end;
        return;
    end;
end;
local v725 = {
    [1] = "\226\150\182\226\128\162 \196\177l\196\177\196\177l\196\177\196\177l\196\177\196\177l\196\177\196\177l\196\177\196\177l\196\177 \239\189\135\239\189\133\239\189\142\239\189\133\239\189\147\239\189\137\239\189\147", 
    [2] = "\226\153\161 \239\189\135\239\189\129\239\189\141\239\189\133\239\189\147\239\189\133\239\189\142\239\189\147\239\189\133 \225\155\173 \239\189\135\239\189\133\239\189\142\239\189\133\239\189\147\239\189\137\239\189\147 \226\153\161", 
    [3] = "\226\153\155 \239\189\135\239\189\129\239\189\141\239\189\133\239\189\147\239\189\133\239\189\142\239\189\147\239\189\133 \226\153\155", 
    [4] = "\239\189\135\239\189\133\239\189\142\239\189\133\239\189\147\239\189\137\239\189\147.\239\189\140\239\189\149\239\189\129 \239\189\135\239\189\129\239\189\150\239\189\133 \239\189\141\239\189\133 \239\189\129 \239\189\135\239\189\143\239\189\132\239\189\141\239\189\143\239\189\132\239\189\133", 
    [5] = "\239\189\133\239\189\147\239\189\148\239\189\139  \239\189\147\239\189\149\239\189\137\239\189\131\239\189\137\239\189\132\239\189\133\239\189\132  \239\189\151\239\189\136\239\189\133\239\189\142  \239\189\135\239\189\133\239\189\142\239\189\133\239\189\147\239\189\137\239\189\147.\239\189\140\239\189\149\239\189\129  \239\189\146\239\189\133\239\189\140\239\189\133\239\189\129\239\189\147\239\189\133\239\189\132", 
    [6] = "\226\153\155 \239\189\130\239\189\140\239\189\129\239\189\141\239\189\133\239\189\140\239\189\133\239\189\147\239\189\147 \239\188\145 \239\188\147 \239\188\147 \239\188\151 \226\153\155", 
    [7] = "( \226\184\157\226\184\157\194\180\234\146\179`\226\184\157\226\184\157) \240\150\185\173 \239\189\135\239\189\133\239\189\142\239\189\133\239\189\147\239\189\137\239\189\147 \226\153\161", 
    [8] = "\240\150\185\173 \239\189\147\239\189\140\239\189\133\239\189\133\239\189\144 \240\150\185\173", 
    [9] = "\226\150\132\239\184\187\227\131\135\226\149\144\226\149\144\226\148\129\228\184\128\240\159\146\168 pro100 \239\189\130\239\189\140\239\189\129\239\189\141\239\189\133\239\189\140\239\189\133\239\189\147\239\189\147", 
    [10] = "\239\189\148\239\189\129\239\189\144\239\189\144\239\189\133\239\189\132 \239\189\130\239\189\153 \239\189\135\239\189\133\239\189\142\239\189\133\239\189\147\239\189\137\239\189\147 \239\189\146\239\189\133\239\189\147\239\189\143\239\189\140\239\189\150\239\189\133\239\189\146", 
    [11] = "\227\128\140\226\156\166\201\162\225\180\135\201\180\225\180\135s\201\170s\226\156\166\227\128\141", 
    [12] = "\201\162\225\180\135\201\180\225\180\135s\201\170s \202\159\225\180\156\225\180\128 \225\180\143\225\180\161\201\180s \225\180\141\225\180\135 \225\180\128\201\180\225\180\133 \225\180\128\202\159\202\159", 
    [13] = "\226\153\158 \201\162\225\180\135\201\180\225\180\135s\201\170s \201\170s \225\180\152\225\180\143\225\180\161\225\180\135\202\128 \225\180\143\225\180\160\225\180\135\202\128 \225\180\128\202\159\202\159 \226\153\158", 
    [14] = "\226\136\158 \201\162\225\180\135\201\180\225\180\135s\201\170s \202\159\225\180\156\225\180\128 \201\170s \225\180\155\202\156\225\180\135 \225\180\152\202\128\225\180\143 \225\180\132\225\180\143\225\180\133\225\180\135 \225\180\132\225\180\143\225\180\141\225\180\141\225\180\128\201\180\225\180\133 \226\153\161", 
    [15] = "\226\154\161 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\160\225\180\143\202\128\225\180\155\225\180\135x \225\180\143\225\180\160\225\180\135\202\128\201\180\225\180\143\225\180\132\225\180\139 \225\180\155\202\128\225\180\135\201\180\225\180\133 \226\154\161", 
    [16] = "\226\156\166 \201\162\225\180\135\201\180\225\180\135s\201\170s \201\170s \225\180\141\201\170\201\180\225\180\133 \225\180\132\225\180\143\225\180\141\225\180\141\225\180\128\201\180\225\180\133 \226\156\166", 
    [17] = "\240\150\161\134 \226\156\170 \225\180\139\201\170\202\159\202\159\225\180\135\202\128 \225\180\161\201\170\225\180\155\202\156 \201\162\225\180\135\201\180\225\180\135s\201\170s \202\159\225\180\156\225\180\128 \226\156\170 \240\150\161\134", 
    [18] = "\226\159\129 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\132\225\180\143\225\180\133\225\180\135 \225\180\152\225\180\143\225\180\161\225\180\135\202\128 \225\155\173", 
    [19] = "\226\156\168 \201\162\225\180\135\201\180\225\180\135s\201\170s \202\159\225\180\156\225\180\128 \225\180\132\225\180\143\225\180\141\225\180\152\202\159\225\180\135\225\180\155\225\180\135\225\180\133 \225\180\141\225\180\135 \226\156\168", 
    [20] = "\226\135\140 \225\180\141\225\180\135\225\180\155\225\180\128\202\159 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\143\225\180\160\225\180\135\202\128\201\180\225\180\143\225\180\132\225\180\139 \202\153\225\180\135\225\180\155\225\180\161\225\180\135\225\180\135\201\180 \225\180\155\202\156\225\180\135 \225\180\132\225\180\143\225\180\133\225\180\135 \226\135\140", 
    [21] = "\226\140\152 \201\162\225\180\135\201\180\225\180\135s\201\170s \202\159\225\180\156\225\180\128 \225\180\141\225\180\135\202\159\225\180\155s \225\180\155\202\156\225\180\135 \225\180\155\201\170\225\180\141\225\180\135 \201\170\201\180\225\180\155\225\180\143 \201\162\225\180\143\225\180\143\225\180\133 \225\180\141\225\180\143\225\180\133\225\180\135 \226\140\152", 
    [22] = "\226\140\152 \225\180\152\202\128\225\180\143\225\180\132\225\180\135ss \225\180\135\201\162\225\180\143 \225\180\161\201\170\225\180\155\202\156 \225\180\143\225\180\160\225\180\135\202\128\201\180\225\180\143\225\180\132\225\180\139 \201\162\225\180\135\201\180\225\180\135s\201\170s \226\140\152", 
    [23] = "\240\159\146\128 \225\180\133\225\180\135\225\180\128\225\180\155\202\156 \225\180\155\225\180\143 \225\180\155\202\156\225\180\135 \201\162\225\180\135\201\180\225\180\135s\201\170s \202\159\225\180\156\225\180\128 \226\153\155", 
    [24] = "\234\167\129 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\132\225\180\143\225\180\141\225\180\152\202\159\225\180\135\225\180\155\225\180\135\201\180\225\180\135ss \225\155\173 \234\167\129", 
    [25] = "\226\154\161 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\143\225\180\160\225\180\135\202\128\201\180\225\180\143\225\180\132\225\180\139 \225\180\143\201\180\225\180\135 \225\180\135\225\180\135\225\180\133 \201\170\201\180\225\180\155\225\180\143 \225\180\155\225\180\143\225\180\152 \225\180\143\225\180\160\225\180\135\202\128", 
    [26] = "\226\136\158 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\133\225\180\135\201\180\225\180\135 \225\180\132\225\180\143\225\180\133\225\180\135 \225\180\143\201\180 \225\180\160\225\180\135\202\128\225\180\155\225\180\135x \202\156\225\180\135\225\180\128\202\128\225\180\155 \225\180\155\201\170\225\180\141\225\180\135 \226\136\158", 
    [27] = "\226\156\166 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\161\225\180\143\202\128\225\180\139s \225\180\139\201\170\202\159\202\159\201\162\225\180\143\225\180\143\225\180\133 \225\180\141\225\180\143\225\180\133\225\180\135 \225\180\135\225\180\160\225\180\135\202\128\202\143\225\180\161\202\156\225\180\135\202\128\225\180\135 \226\156\166", 
    [28] = "\226\153\155 \225\180\135\201\180\201\162\201\170\201\180\225\180\135 \225\180\143\225\180\155\202\156\225\180\135\202\128 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\141\225\180\143\225\180\133\225\180\135 \201\180\225\180\143\225\180\161 \226\153\155", 
    [29] = "\240\159\150\164 \240\157\152\189\240\157\153\161\240\157\153\150\240\157\153\162\240\157\153\154\240\157\153\161\240\157\153\154\240\157\153\168\240\157\153\168 \240\157\153\156\240\157\153\150\240\157\153\162\240\157\153\154\240\157\153\168\240\157\153\154\240\157\153\163\240\157\153\168\240\157\153\154 \240\159\150\164", 
    [30] = "\226\153\155 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\132\225\180\143\225\180\141\225\180\135 \225\180\161\201\170\225\180\155\202\156 \225\180\160\201\170\225\180\132\225\180\155\225\180\143\202\128\201\170\225\180\143\225\180\156s \225\180\141\225\180\143\225\180\133\225\180\135 \226\153\155", 
    [31] = "\226\154\148\239\184\143 \225\180\132\225\180\143\225\180\141\225\180\152\202\159\225\180\135\225\180\155\225\180\135 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\143\225\180\160\225\180\135\202\128\225\180\141\225\180\135\225\180\155\202\156\225\180\135\225\180\143\225\180\133\226\154\148\239\184\143", 
    [32] = "\226\153\166 \225\180\133\225\180\135\225\180\160\201\170\202\159 \225\180\143\225\180\160\225\180\135\202\128\201\180\225\180\143\225\180\132\225\180\139 \225\180\160\225\180\135\202\128\240\157\145\135 \201\162\225\180\135\201\180\225\180\135s\201\170s \226\153\166"
};
events.player_death:set(function(v726)
    -- upvalues: v326 (ref), v725 (ref)
    if not v326.misc.trashtalk:get() then
        return;
    else
        local v727 = entity.get_local_player();
        if entity.get(v726.attacker, true) == v727 and entity.get(v726.userid, true) ~= v727 then
            utils.execute_after(3, utils.console_exec, "say " .. v725[math.random(1, #v725)]);
        end;
        return;
    end;
end);
local function v732(v728)
    -- upvalues: v326 (ref), v396 (ref)
    local v729 = entity.get_local_player();
    if not v729 then
        return;
    else
        local v730 = v729:get_player_weapon();
        if not v730 then
            return;
        else
            local v731 = v730:get_weapon_info();
            if not v731 then
                return;
            else
                if v326.misc.auto_hs:get() and ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() and v731.cycle_time > 1 and rage.exploit:get() > 0.99 and (v396(v728) == "SNAKING" or v396(v728) == "CROUCHING") then
                    ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):override(true);
                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override(false);
                else
                    ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):override();
                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override();
                end;
                return;
            end;
        end;
    end;
end;
local function v741(v733)
    -- upvalues: v396 (ref), v326 (ref)
    local v734 = entity.get_local_player();
    if not v734 then
        return;
    else
        local v735 = v734:get_player_weapon();
        if not v735 then
            return;
        else
            local v736 = v735:get_weapon_index();
            if not v736 then
                return;
            else
                local v737 = v735:get_weapon_info();
                if not v737 then
                    return;
                else
                    local v738 = 0;
                    local v739 = false;
                    local v740 = v396(v733) == "AIR" or v396(v733) == "AIR~C";
                    if v326.misc.hitchance:get() then
                        if v740 then
                            if v326.misc.hitchance_air:get("Scout") and v736 == 40 then
                                v738 = v326.misc.hitchance_air_scout:get();
                                v739 = true;
                            elseif v326.misc.hitchance_air:get("R8") and v736 == 64 then
                                v738 = v326.misc.hitchance_air_r8:get();
                                v739 = true;
                            elseif v326.misc.hitchance_air:get("Shotgun") and v737.weapon_class == "primary_shotgun" then
                                v738 = v326.misc.hitchance_air_shotgun:get();
                                v739 = true;
                            elseif v326.misc.hitchance_air:get("SMG") and v737.weapon_class == "primary_smg" then
                                v738 = v326.misc.hitchance_air_smg:get();
                                v739 = true;
                            else
                                v739 = false;
                            end;
                        elseif not v734.m_bIsScoped then
                            if v326.misc.hitchance_scope:get("AWP") and v736 == 9 then
                                v738 = v326.misc.hitchance_scope_awp:get();
                                v739 = true;
                            elseif v326.misc.hitchance_scope:get("Auto") and (v736 == 11 or v736 == 38) then
                                v738 = v326.misc.hitchance_scope_auto:get();
                                v739 = true;
                            elseif v326.misc.hitchance_scope:get("Scout") and v736 == 40 then
                                v738 = v326.misc.hitchance_scope_scout:get();
                                v739 = true;
                            else
                                v739 = false;
                            end;
                        else
                            v739 = false;
                        end;
                    end;
                    if v739 == true then
                        ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"):override(v738);
                    else
                        ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"):override();
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
local function v748(v742)
    local v743 = entity.get_local_player();
    if not v743 then
        return;
    else
        local v744 = v743:get_origin();
        if v743.m_vecVelocity.z > -500 then
            return;
        else
            local v745 = vector(v744.x, v744.y, v744.z);
            local v746 = vector(v744.x, v744.y, v744.z - 50);
            local v747 = vector(v744.x, v744.y, v744.z - 15);
            if utils.trace_line(v745, v747).fraction ~= 1 then
                v742.in_duck = 0;
            elseif utils.trace_line(v745, v746).fraction ~= 1 then
                v742.in_duck = 1;
            end;
            return;
        end;
    end;
end;
local function v751(v749)
    local v750 = entity.get_local_player();
    if not v750 then
        return;
    elseif v750.m_MoveType ~= 9 then
        return;
    else
        if v749.sidemove == 0 then
            v749.view_angles.y = v749.view_angles.y + 45;
        end;
        if v749.sidemove < 0 and v749.in_forward then
            v749.view_angles.y = v749.view_angles.y + 90;
        end;
        if v749.sidemove > 0 and v749.in_back then
            v749.view_angles.y = v749.view_angles.y + 90;
        end;
        v749.in_moveleft = v749.in_back;
        v749.in_moveright = v749.in_forward;
        if v749.view_angles.x < 0 then
            v749.view_angles.x = -45;
        end;
        return;
    end;
end;
local function v755(v752)
    local v753 = entity.get_local_player();
    if not v753 then
        return;
    elseif bit.band(v753.m_fFlags, 1) == 1 then
        return;
    else
        if v753.m_vecVelocity:length() >= 130 then
            local v754 = entity.get_threat(true);
            if v754 ~= nil then
                if bit.band(v754.m_fFlags, 1) == 0 then
                    return;
                else
                    v752.force_defensive = true;
                    utils.execute_after(0.02, function()
                        rage.exploit:force_teleport();
                    end);
                end;
            end;
        end;
        return;
    end;
end;
local function v760(v756, v757)
    local v758 = math.sqrt(v756.forwardmove * v756.forwardmove + v756.sidemove * v756.sidemove);
    if v757 <= 0 or v758 <= 0 then
        return;
    else
        if v756.in_duck == 1 then
            v757 = v757 * 2.94117647;
        end;
        if v758 <= v757 then
            return;
        else
            local v759 = v757 / v758;
            v756.forwardmove = v756.forwardmove * v759;
            v756.sidemove = v756.sidemove * v759;
            return;
        end;
    end;
end;
local function v763(v761)
    if not v761 then
        return;
    else
        local v762 = v761:get_player_weapon();
        if not v762 then
            return;
        else
            return v762.m_flNextPrimaryAttack < globals.curtime;
        end;
    end;
end;
local function v781(v764)
    -- upvalues: v763 (ref), v760 (ref)
    local v765 = entity.get_local_player();
    if not v765 then
        return;
    else
        local v766 = v765:get_player_weapon();
        if not v766 then
            return;
        else
            local v767 = v766:get_inaccuracy();
            if not v767 then
                return;
            else
                local v768 = v766:get_weapon_info();
                local _ = bit.band(v765.m_fFlags, 1) == 1;
                local v770 = v765:get_eye_position();
                local l_m_bIsScoped_2 = v765.m_bIsScoped;
                local v772 = v763(v765);
                local v773 = entity.get_players(true, true);
                for v774 = 1, #v773 do
                    local v775 = v773[v774];
                    if v775:is_dormant() then
                        origin = v775:get_origin();
                        local v776 = v775:get_bbox();
                        if origin.x ~= 0 and v776.alpha ~= 0 and (v775:get_network_state() == 1 or not (v775:get_network_state() ~= 2) or not (v775:get_network_state() ~= 3) or v775:get_network_state() == 4) then
                            local v777 = origin + vector(0, 0, 30);
                            local v778 = v770:to(v777):angles();
                            local v779, v780 = utils.trace_bullet(v765, vector(v770.x, v770.y, v770.z), vector(v777.x, v777.y, v777.z), true);
                            if v780 then
                                if not v780:did_hit_world() then
                                    return;
                                elseif (v780.fraction < 1 or v780.fraction_left_solid == 1) and ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get() < v779 and not v775:is_visible() and v772 then
                                    v760(v764, (l_m_bIsScoped_2 and v768.max_player_speed_alt or v768.max_player_speed) * 0.33);
                                    if v768.weapon_class == "primary_sniper" and not l_m_bIsScoped_2 then
                                        v764.in_attack2 = 1;
                                    end;
                                    if v767 < 0.009 and v764.choked_commands == 0 then
                                        v764.no_choke = true;
                                        v764.view_angles.x = v778.x;
                                        v764.view_angles.y = v778.y;
                                        v764.in_attack = 1;
                                        print_dev("[DA] Shot to " .. v775:get_name() .. " | DMG: " .. v779);
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
end;
local function v785(v782)
    local v783 = entity.get_local_player();
    if not v783 then
        return;
    elseif v783.m_MoveType == 9 or v783.m_MoveType == 8 or v782.in_jump then
        return;
    else
        local v784 = v783:simulate_movement();
        v784:think(5);
        if v784.velocity.z ~= 0 then
            v782.block_movement = 2;
        end;
        return;
    end;
end;
local function v791(v786, v787)
    if not globals.is_connected then
        return;
    else
        local v788 = "               " .. v786 .. "                      ";
        local _ = globals.tickinterval;
        local v790 = (globals.tickcount + math.floor(utils.net_channel().avg_latency[0] + 0.22 / globals.tickinterval + 0.5)) / math.floor(0.3 / globals.tickinterval + 0.5);
        v790 = v787[math.floor(v790 % #v787) + 1] + 1;
        return string.sub(v788, v790, v790 + 15);
    end;
end;
local function v793()
    -- upvalues: v791 (ref)
    if not globals.is_in_game then
        return;
    elseif not globals.choked_commands then
        return;
    else
        local v792 = v791("genesis.lua", {
            [1] = 2, 
            [2] = 3, 
            [3] = 4, 
            [4] = 5, 
            [5] = 6, 
            [6] = 7, 
            [7] = 8, 
            [8] = 9, 
            [9] = 10, 
            [10] = 11, 
            [11] = 11, 
            [12] = 10, 
            [13] = 9, 
            [14] = 8, 
            [15] = 7, 
            [16] = 6, 
            [17] = 5, 
            [18] = 4, 
            [19] = 3, 
            [20] = 2, 
            [21] = 0
        });
        if entity.get_game_rules().m_gamePhase == 5 or entity.get_game_rules().m_gamePhase == 4 then
            v792 = v791("genesis.lua", {
                [1] = 11
            });
            common.set_clan_tag(v792);
        elseif v792 ~= tag_text_prev then
            common.set_clan_tag(v792);
        end;
        tag_text_prev = v792;
        return;
    end;
end;
v326.misc.clantag:set_callback(function(v794)
    if not v794:get() then
        common.set_clan_tag("");
    end;
end);
local v795 = l_pui_0.setup({
    [1] = v326.main, 
    [2] = v326.antiaim, 
    [3] = v326.builder, 
    [4] = v326.builder_t, 
    [5] = v326.visuals, 
    [6] = v326.misc
}, true);
v326.import:set_callback(function()
    -- upvalues: v795 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
    v795:load(json.parse(l_base64_0.decode(l_clipboard_0:get())));
    cvar.play:call("ambient\\tones\\elev1");
end);
v326.default:set_callback(function()
    local config_str = "W3sidGFiIjoxLjB9LHsiYWRkaXRpb25zIjpbIlNhZmUgSGVhZCIsIkF2b2lkIEJhY2tzdGFiIiwifiJdLCJhbmltX2FpciI6IkJldHRlciBKaXR0ZXIiLCJhbmltX2Fpcl9qaXR0ZXIiOjEwMC4wLCJhbmltX2JyZWFrZXJzIjp0cnVlLCJhbmltX2dyb3VuZCI6IkJldHRlciBKaXR0ZXIiLCJhbmltX2ppdHRlciI6NzAuMCwiYW5pbV9sZWFuIjoxMDAuMCwiYW5pbV9vdGhlciI6WyJNb3ZlIExlYW4iLCJ+Il0sImNvbmRpdGlvbnMiOiJHZW5lcmFsIiwiY29uZmlnX21hbmFnZXIiOnRydWUsImVuYWJsZSI6dHJ1ZSwiZnJlZXN0YW5kaW5nIjpmYWxzZSwiZnJlZXN0YW5kaW5nX2JvZHlmcmVlc3RhbmRpbmciOnRydWUsImZyZWVzdGFuZGluZ19kaXNhYmxleWF3bW9kIjp0cnVlLCJmcmVlc3RhbmRpbmdfZmxpY2siOnRydWUsImZyZWVzdGFuZGluZ19oaXQiOmZhbHNlLCJwaXRjaCI6IkRvd24iLCJzYWZlX2hlYWQiOlsiQWlyfkMgS25pZmUiLCJIZWlnaHQgRGlmZmVyZW5jZSIsIn4iXSwic2FmZV9oZWFkX2RpZmZlcmVuY2UiOjEwMC4wLCJ0ZWFtIjoiVCIsInlhdyI6IkF0IFRhcmdldCIsInlhd19mbGljayI6dHJ1ZSwieWF3X2hpdCI6ZmFsc2UsInlhd19zdGF0aWMiOnRydWV9LFt7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiUmFuZG9tIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjMuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjpmYWxzZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjcuMCwieWF3X3JpZ2h0Ijo2LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTUuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo4LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6ZmFsc2UsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xNS4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo4LjAsInlhd19yaWdodCI6OC4wLCJ5YXdtb2RpZmllciI6IkNlbnRlciIsInlhd21vZGlmaWVyX29mZnNldCI6LTQxLjAsInlhd21vZGlmaWVyX3JhbmRvbSI6NS4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOmZhbHNlLCJkZWZlbnNpdmVfY2xlYXIiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJTaWRlIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJ+Il0sImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xODAuMCwiZGVsYXkiOjUuMCwiZW5hYmxlIjp0cnVlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6LTMxLjAsInlhd19yaWdodCI6MzQuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6LTU5LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6Ny4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IlJhbmRvbSIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiUmFuZG9tIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi05MS4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo0LjAsInlhd19yaWdodCI6NC4wLCJ5YXdtb2RpZmllciI6IlJhbmRvbSIsInlhd21vZGlmaWVyX29mZnNldCI6LTY1LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6OC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6Ik9mZnNldCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi04OS4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xNC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo3LjAsInlhd19yaWdodCI6OC4wLCJ5YXdtb2RpZmllciI6IkNlbnRlciIsInlhd21vZGlmaWVyX29mZnNldCI6LTYwLjAsInlhd21vZGlmaWVyX3JhbmRvbSI6MC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiT2Zmc2V0IiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6LTg5LjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IlNwaW4iLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6LTE0LjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjYuMCwieWF3X3JpZ2h0Ijo2LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjowLjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi03My4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xNC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo1LjAsInlhd19yaWdodCI6NC4wLCJ5YXdtb2RpZmllciI6IkNlbnRlciIsInlhd21vZGlmaWVyX29mZnNldCI6LTcuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo4LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi03My4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xNC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0IjoxMS4wLCJ5YXdfcmlnaHQiOjQuMCwieWF3bW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi01OC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjUuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJ+Il0sImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjowLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0IjowLjAsInlhd19yaWdodCI6MC4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjowLjAsInlhd21vZGlmaWVyX3JhbmRvbSI6MC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiUmFuZG9tIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJEZWZhdWx0IiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjMuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjpmYWxzZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6Ny4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6Ni4wLCJ5YXdtb2RpZmllciI6IkNlbnRlciIsInlhd21vZGlmaWVyX29mZnNldCI6LTU1LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6OC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6Ik9mZnNldCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi04OS4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJGbGljayBFeHBsb2l0IFYyIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi05MC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjp0cnVlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6NS4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6NS4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNDEuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo1LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiMy1XYXkiLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6LTM4LjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZXhwbG9pdF9kaXJlY3Rpb24iOnRydWUsImZvcmNlX2RlZiI6dHJ1ZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjYuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjYuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6LTM4LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6Ny4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJQZWVrIEZha2UiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiUmFuZG9tIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJGbGljayBFeHBsb2l0IFYyIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi05MC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjp0cnVlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6MTIuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjEyLjAsInlhd21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi02NS4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjguMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfY2xlYXIiOnRydWUsImRlZmVuc2l2ZV9waXRjaCI6Ik9mZnNldCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi04OS4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xNC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjpmYWxzZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjcuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjguMCwieWF3bW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi02MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfY2xlYXIiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmZzZXQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotODkuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiRGVmYXVsdCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTQuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo2LjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0Ijo2LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjoxNS4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotNzMuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiUHJvZ3Jlc3NpdmUgU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6dHJ1ZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjUuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjQuMCwieWF3bW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi03LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6OC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IlByb2dyZXNzaXZlIFNwaW4iLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6LTEwLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0IjoxMi4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MTguMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJ+Il0sImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjowLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6ZmFsc2UsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjpmYWxzZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjAuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjAuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJ+Il0sImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjowLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6ZmFsc2UsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjpmYWxzZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjAuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjAuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH1dLHsiKndvcmxkX2hpdG1hcmtlciI6IiM4RUVBRENGRiIsIip3b3JsZF9taXNzbWFya2VyIjoiI0VBOEU4RUZGIiwiY3Jvc3NoYWlyX2luZCI6ZmFsc2UsImNyb3NzaGFpcl9pbmRfY29sb3IxIjoiI0M4QzhDOEZGIiwiY3Jvc3NoYWlyX2luZF9jb2xvcjIiOiIjOTY5Njk2RkYiLCJjcm9zc2hhaXJfaW5kX2NvbG9yMyI6IiM2NDY0NjRGRiIsImNyb3NzaGFpcl9pbmRfc3R5bGUiOjEuMCwiY3VzdG9tX3Njb3BlIjp0cnVlLCJjdXN0b21fc2NvcGVfYW5pbSI6MTUuMCwiY3VzdG9tX3Njb3BlX2NvbG9yIjoiI0ZGRkZGRjUzIiwiY3VzdG9tX3Njb3BlX2xlbmd0aCI6MjUwLjAsImN1c3RvbV9zY29wZV9vZmZzZXQiOjUuMCwiZGFtYWdlX2luZGljYXRvciI6dHJ1ZSwiZ3NfaW5kaWNhdG9ycyI6dHJ1ZSwiZ3Nfc3BlY3RhdG9ycyI6dHJ1ZSwic29sdXNfdWkiOnRydWUsInNvbHVzX3VpX2NvbG9yIjoiI0JBQzRGOUZGIiwic29sdXNfdWlfbGlzdCI6WyJ+Il0sInNvbHVzX3VpX25hbWUiOiJvZ195b3VuZyIsInNvbHVzX3VpX3JvdW5kIjozLjAsInNvbHVzX3VpX3R5cGUiOjEuMCwid2luZG93cyI6dHJ1ZSwid2luZG93c19kZWZlbnNpdmUiOiJEZWZhdWx0Iiwid2luZG93c19kZWZlbnNpdmVfY2xyIjoiI0RDRENEQ0ZGIiwid2luZG93c19zZWxlY3QiOlsxLjAsMi4wLCJ+Il0sIndpbmRvd3Nfc2xvd2VkIjoiRGVmYXVsdCIsIndpbmRvd3Nfc2xvd2VkX2NsciI6IiNEQ0RDRENGRiIsIndvcmxkX2hpdG1hcmtlciI6dHJ1ZSwid29ybGRfaGl0bWFya2VyX2NsciI6IiM4RUVBRENGRiIsIndvcmxkX21pc3NtYXJrZXIiOnRydWUsIndvcmxkX21pc3NtYXJrZXJfY2xyIjoiI0VBOEU4RUZGIn0seyJhc3BlY3RyYXRpbyI6dHJ1ZSwiYXNwZWN0cmF0aW9fYW1vdW50IjoxMzMuMCwiYXV0b19ncmVuYWRlIjpmYWxzZSwiYXV0b19ncmVuYWRlX2hlIjoyMC4wLCJhdXRvX2dyZW5hZGVfbW9sb3RvdiI6MTAwLjAsImF1dG9faHMiOnRydWUsImF1dG9fdGVsZXBvcnQiOmZhbHNlLCJjbGFudGFnIjpmYWxzZSwiZG9ybWFudF9haW1ib3QiOmZhbHNlLCJmYWtlcGluZyI6ZmFsc2UsImZha2VwaW5nX2Ftb3VudCI6MTU4LjAsImZhc3RsYWRkZXIiOnRydWUsImhpdGNoYW5jZSI6dHJ1ZSwiaGl0Y2hhbmNlX2FpciI6WyJTY291dCIsIlI4IiwifiJdLCJoaXRjaGFuY2VfYWlyX3I4IjozNS4wLCJoaXRjaGFuY2VfYWlyX3Njb3V0Ijo0MC4wLCJoaXRjaGFuY2VfYWlyX3Nob3RndW4iOjQwLjAsImhpdGNoYW5jZV9haXJfc21nIjo0MC4wLCJoaXRjaGFuY2Vfc2NvcGUiOlsifiJdLCJoaXRjaGFuY2Vfc2NvcGVfYXV0byI6NDAuMCwiaGl0Y2hhbmNlX3Njb3BlX2F3cCI6NDAuMCwiaGl0Y2hhbmNlX3Njb3BlX3Njb3V0Ijo0MC4wLCJub19mYWxsX2RhbWFnZSI6dHJ1ZSwicmFnZV9sb2dzIjp0cnVlLCJyYWdlX2xvZ3NfaGl0IjoiI0JBQzRGOUZGIiwicmFnZV9sb2dzX21pc3MiOiIjQkE1QTVBRkYiLCJyYWdlX2xvZ3Nfcm91bmQiOjMuMCwicmFnZV9sb2dzX3N0eWxlIjo4LjAsInJhZ2VfbG9nc190eXBlIjpbMS4wLDIuMCwzLjAsIn4iXSwidHJhc2h0YWxrIjpmYWxzZSwidmlld21vZGVsIjpmYWxzZSwidmlld21vZGVsX2ZvdiI6NjkuMCwidmlld21vZGVsX3giOjMuMCwidmlld21vZGVsX3kiOjAuMCwidmlld21vZGVsX3oiOi0yLjB9XQ=="

    -- 1. Decode & Parse
    local success, decoded_json = pcall(l_base64_0.decode, config_str)
    if success and decoded_json then
        local parse_success, config_table = pcall(json.parse, decoded_json)
        if parse_success and type(config_table) == "table" then
            -- 2. FIX: Repair malformed color keys in Visuals (5) and Misc (6)
            for i = 5, 6 do
                if config_table[i] and type(config_table[i]) == "table" then
                    for k, v in pairs(config_table[i]) do
                        -- CRASH FIX: Check if k is string before running string.sub
                        if type(k) == "string" and string.sub(k, 1, 1) == "*" then
                            local plain_key = string.sub(k, 2)
                            if config_table[i][plain_key] == nil then
                                config_table[i][plain_key] = v
                            end
                        end
                    end
                end
            end
            
            -- 3. Load
            v795:load(config_table)
            cvar.play:call("ambient\\tones\\elev1")
        else
            print("[Genesis] Error parsing default config JSON.")
        end
    else
        print("[Genesis] Error decoding default config Base64.")
    end
end);
local v796 = false;
local function v797()
    -- upvalues: v796 (ref)
    if v796 then
        utils.console_exec("-attack");
    end;
end;
local _ = render.camera_position();
events.grenade_prediction:set(function(v799)
    -- upvalues: v326 (ref), v763 (ref), v797 (ref)
    if not v326.misc.auto_grenade:get() then
        return;
    else
        local v800 = entity.get_local_player();
        if v800 == nil then
            return;
        elseif not v800:is_alive() then
            return;
        elseif not v763(v800) then
            return;
        else
            if v799.damage ~= 0 then
                if v799.type == "Molly" then
                    if v799.damage > v326.misc.auto_grenade_molotov:get() then
                        v797();
                    end;
                elseif v799.type == "Smoke" then
                    if v799.damage ~= 0 then
                        v797();
                    end;
                elseif v799.type == "Frag" and (v799.fatal or v799.damage > v326.misc.auto_grenade_he:get()) then
                    v797();
                end;
            end;
            return;
        end;
    end;
end);
local function v801()
    -- upvalues: v326 (ref)
    cvar.sv_competitive_minspec:int(0);
    cvar.viewmodel_fov:int(v326.misc.viewmodel:get() and v326.misc.viewmodel_fov:get() or 68);
    cvar.viewmodel_offset_x:float(v326.misc.viewmodel:get() and v326.misc.viewmodel_x:get() or 2.5);
    cvar.viewmodel_offset_y:float(v326.misc.viewmodel:get() and v326.misc.viewmodel_y:get() or 0);
    cvar.viewmodel_offset_z:float(v326.misc.viewmodel:get() and v326.misc.viewmodel_z:get() or -1.5);
end;
v801();
v326.misc.viewmodel:set_callback(function()
    -- upvalues: v801 (ref)
    v801();
end);
v326.misc.viewmodel_fov:set_callback(function()
    -- upvalues: v801 (ref)
    v801();
end);
v326.misc.viewmodel_x:set_callback(function()
    -- upvalues: v801 (ref)
    v801();
end);
v326.misc.viewmodel_y:set_callback(function()
    -- upvalues: v801 (ref)
    v801();
end);
v326.misc.viewmodel_z:set_callback(function()
    -- upvalues: v801 (ref)
    v801();
end);
local function v802()
    -- upvalues: v326 (ref)
    cvar.r_aspectratio:float(v326.misc.aspectratio:get() and v326.misc.aspectratio_amount:get() / 100 or 0);
end;
v802();
v326.misc.aspectratio:set_callback(function()
    -- upvalues: v802 (ref)
    v802();
end);
v326.misc.aspectratio_amount:set_callback(function()
    -- upvalues: v802 (ref)
    v802();
end);
events.render:set(function()
    -- upvalues: v303 (ref), v460 (ref), v482 (ref), v326 (ref), v324 (ref), v505 (ref), v793 (ref), v601 (ref), v619 (ref), v629 (ref), v664 (ref), v705 (ref), v660 (ref), v476 (ref), v596 (ref), v593 (ref), v724 (ref), v632 (ref)
    for _, v804 in pairs(v303) do
        v804:update(globals.frametime);
    end;
    v460();
    v482();
    if v326.visuals.custom_scope:get() then
        v324.scopeoverlay:override("Remove All");
        v505();
    else
        v324.scopeoverlay:override();
    end;
    if v326.misc.clantag:get() then
        v793();
    end;
    if v326.visuals.solus_ui:get() then
        if v326.visuals.solus_ui_list:get(1) then
            v601();
        end;
        if v326.visuals.solus_ui_list:get(2) then
            v619:update();
        end;
        if v326.visuals.solus_ui_list:get(3) then
            v629:update();
        end;
        if v326.visuals.solus_ui_list:get(4) then
            v664:update();
        end;
    end;
    if v326.visuals.gs_indicators:get() and v326.visuals.gs_features:get() then
        v705();
    end;
    if v326.visuals.gs_indicators:get() or v326.visuals.solus_ui:get() and v326.visuals.solus_ui_list:get(4) then
        v660();
    end;
    if v326.visuals.gs_spectators:get() and v326.visuals.gs_features:get() then
        render.spectators();
    end;
    if v326.visuals.world_hitmarker:get() then
        v476();
    end;
    if v326.visuals.windows:get() then
        if v326.visuals.windows_select:get(1) then
            v596:update();
        end;
        if v326.visuals.windows_select:get(2) then
            v593:update();
        end;
    end;
    if v326.visuals.crosshair_ind:get() then
        v724();
    end;
    if v326.visuals.damage_indicator:get() then
        v632:update();
    end;
end);
local function v810(v805)
    -- upvalues: v324 (ref)
    local v806 = entity.get_local_player():get_player_weapon();
    if not v806 then
        return;
    else
        local v807 = v806:get_classname();
        if not v807 then
            return;
        else
            local v808 = string.match(v807, "Grenade");
            local l_m_fThrowTime_0 = v806.m_fThrowTime;
            if v808 then
                rage.exploit:allow_defensive(false);
                v805.force_defensive = false;
                if l_m_fThrowTime_0 ~= nil and l_m_fThrowTime_0 ~= 0 then
                    v324.bodyyaw:override(false);
                end;
            end;
            return;
        end;
    end;
end;
events.createmove:set(function(v811)
    -- upvalues: v796 (ref), v438 (ref), v326 (ref), v751 (ref), v748 (ref), v781 (ref), v755 (ref), v732 (ref), v741 (ref), v810 (ref), v785 (ref), v452 (ref), v404 (ref)
    v796 = v811.in_attack;
    v438(v811);
    if v326.misc.fastladder:get() then
        v751(v811);
    end;
    if v326.misc.no_fall_damage:get() then
        v748(v811);
    end;
    if v326.misc.dormant_aimbot:get() then
        v781(v811);
    end;
    if v326.misc.auto_teleport:get() then
        v755(v811);
    end;
    v732(v811);
    v741(v811);
    v810(v811);
    if v326.misc.fakeping:get() then
        ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):override(v326.misc.fakeping_amount:get());
    else
        ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):override();
    end;
    if v326.misc.edge_stop:get() then
        v785(v811);
    end;
    if v452 then
        v811.jitter_move = true;
    end;
    me = entity.get_local_player();
    if not me or not me:is_alive() then
        return;
    else
        if rage.exploit:get() < 1 then
            v404.tickbase_check = false;
        end;
        v404.tickbase_check = globals.tickcount > entity.get_local_player().m_nTickBase;
        return;
    end;
end);
events.localplayer_transparency:set(function()
    -- upvalues: v326 (ref)
    if v326.visuals.gs_trans:get() then
        me = entity.get_local_player();
        if not me:is_alive() then
            return;
        elseif me.m_bResumeZoom or me.m_bIsScoped then
            return 59;
        else
            return;
        end;
    else
        return;
    end;
end);
events.level_init:set(function()
    -- upvalues: v405 (ref), v307 (ref)
    v405();
    v307 = {};
end);
events.mouse_input:set(function()
    return ui.get_alpha() <= 0;
end);
events.round_start:set(function()
    -- upvalues: v477 (ref), v405 (ref), v462 (ref)
    v477 = {};
    v405();
    reset_bomb();
    v462 = {};
end);
events.shutdown:set(function()
    -- upvalues: v318 (ref), v317 (ref)
    local v812 = common.get_unixtime() - v318;
    v317[3] = v317[3] + v812;
    db.genesis_pidor = v317;
    db.genesis_beta3 = configs_db;
    common.set_clan_tag("");
    cvar.viewmodel_offset_x:float(2.5);
    cvar.viewmodel_offset_y:float(0);
    cvar.viewmodel_offset_z:float(-1.5);
    cvar.r_aspectratio:float(0);
end);
events.bomb_abortplant:set(reset_bomb);
events.bomb_exploded:set(reset_bomb);
events.bomb_defused:set(reset_bomb);
events.bomb_planted:set(reset_bomb);
events.bomb_beginplant:set(bomb_beginplant);
events.voice_message(function(v813)
    -- upvalues: v307 (ref)
    if not v813.entity then
        return;
    else
        if v813.is_nl then
            v307[v813.entity:get_xuid()] = true;
        end;
        return;
    end;
end);