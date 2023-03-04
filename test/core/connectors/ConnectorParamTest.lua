local ConnectorParam = require "core/connectors/ConnectorParam"

local function test1()
   local connectorParam = ConnectorParam:create()
   
   assert(connectorParam ~= nil, "Error!")
   assert(connectorParam:getName() == nil, "Error!")  
   assert(connectorParam:getType() == nil, "Error!")   
end

local function test2()  
   local atts = {
     name = "var",
     type = "integer"
   }     
   
   local connectorParam = ConnectorParam:create(atts)
   
   assert(connectorParam:getName() == "var", "Error!")  
   assert(connectorParam:getType() == "integer", "Error!") 
end

local function test3()    
   local connectorParam = ConnectorParam:create()
   
   connectorParam:setName("var")  
   connectorParam:setType("integer") 
   
   assert(connectorParam:getName() == "var", "Error!")  
   assert(connectorParam:getType() == "integer", "Error!") 
end

local function test4()
  local connectorParam = ConnectorParam:create()
  local status, err

  status, err = pcall(connectorParam["setName"], connectorParam, nil)
  assert(not(status), "Error!")

  status, err = pcall(connectorParam["setName"], connectorParam, 999999)
  assert(not(status), "Error!")

  status, err = pcall(connectorParam["setName"], connectorParam, {})
  assert(not(status), "Error!")

  status, err = pcall(connectorParam["setName"], connectorParam, function(a, b) return a+b end)
  assert(not(status), "Error!")
end

local function test5()
   local atts = {
     name = "var",
     type = "integer"
   }    
      
   local connectorParam = ConnectorParam:create(atts)
   
   local nclExp = "<connectorParam"   
   for attribute, _ in pairs(connectorParam:getAttributesTypeMap()) do
      nclExp = nclExp.." "..attribute.."=\""..tostring(connectorParam[attribute]).."\""
   end 
  
   nclExp = nclExp.."/>\n"

   local nclRet = connectorParam:table2Ncl(0)

   assert(nclExp == nclRet, "Error!")
end

test1()
test2()
test3()
test4()
test5()