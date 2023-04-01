---
-- Implements <a href="http://handbook.ncl.org.br/doku.php?id=attributeassessment"/>&lt;attributeassessment&gt;</a> ncl element.
-- @module AttributeAssessment
-- @author Gabriel Pereira Mendes
-- @copyright <a href="https://eic.cefet-rj.br/~gpmm/"/>Grupo de Pesquisa em Multimídia</a>  2017-2023
-- @alias AttributeAssessment

local NCLElem = require "src/core/NCLElem"

local AttributeAssessment = NCLElem:extends()

---
-- Name of &lt;attributeAssessment&gt; ncl element. 
AttributeAssessment.nameElem = "attributeAssessment"

---
-- List containing the data types of each attribute
-- belonging to &lt;attributeAssessment&gt; ncl element.
-- @field role type of role attribute (string).
-- @field eventType type of eventType attribute (string).
-- @field key type of key attribute (string).
-- @field attributeType type of attributeType attribute (string).
-- @field offset type of offset attribute (string).
-- @table attributesTypeMap
AttributeAssessment.attributesTypeMap = {
  role = "string",
  eventType = "string",
  key = "string",
  attributeType = "string",
  offset = "string"
}

---
-- List containing all possible pre-definied values to attributes of type string belonging to &lt;attributeAssessment&gt; ncl element.
-- @field eventType list with possible values to eventType attribute ("presentation", "selection" or "attribution").
-- @field key list with possible values to key attribute ("0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
-- "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
-- "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
-- "U", "V", "W", "X", "Y", "Z", "*", "#", "MENU",
-- "INFO", "GUIDE", "CURSOR_DOWN", "CURSOR_LEFT",
-- "CURSOR_RIGHT", "CURSOR_UP", "CHANNEL_DOWN",
-- "CHANNEL_UP", "VOLUME_DOWN", "VOLUME_UP", "ENTER",
-- "RED", "GREEN", "YELLOW", "BLUE", "BACK", "EXIT",
-- "POWER", "REWIND", "STOP", "EJECT", "PLAY", "RECORD" or "PAUSE").
-- @field attributeType list with possible values to attributeType attribute ("nodeProperty", "occurrences", "repetition" or "state").
-- @table attributesStringValueMap
AttributeAssessment.attributesStringValueMap = {
  eventType = {"presentation", "selection", "attribution"},
  key = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
    "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
    "U", "V", "W", "X", "Y", "Z", "*", "#", "MENU",
    "INFO", "GUIDE", "CURSOR_DOWN", "CURSOR_LEFT",
    "CURSOR_RIGHT", "CURSOR_UP", "CHANNEL_DOWN",
    "CHANNEL_UP", "VOLUME_DOWN", "VOLUME_UP", "ENTER",
    "RED", "GREEN", "YELLOW", "BLUE", "BACK", "EXIT",
    "POWER", "REWIND", "STOP", "EJECT", "PLAY", "RECORD", "PAUSE"},
  attributeType = {"nodeProperty", "occurrences", "repetition", "state"}
}

---
-- Returns a new AttributeAssessment object.   
-- @param attributes list of attributes to be initialized.
-- @return new AttributeAssessment object created.
function AttributeAssessment:create(attributes)
  local attributeAssessment = AttributeAssessment:new()

  attributeAssessment.role = nil
  attributeAssessment.eventType = nil
  attributeAssessment.key = nil
  attributeAssessment.attributeType = nil
  attributeAssessment.offset = nil

  if(attributes ~= nil)then
    attributeAssessment:setAttributes(attributes)
  end

  return attributeAssessment
end

---
-- Sets a value to role attribute of &lt;attributeAssessment&gt; ncl element. 
-- @param role role attribute of &lt;attributeAssessment&gt; ncl element.
function AttributeAssessment:setRole(role)
  self:addAttribute("role", role)
end

---
-- Returns the value of the role attribute of &lt;attributeAssessment&gt; ncl element. 
-- @return role role attribute of &lt;attributeAssessment&gt; ncl element.
function AttributeAssessment:getRole()
  return self:getAttribute("role")
end

---
-- Sets a value to eventType attribute of &lt;attributeAssessment&gt; ncl element. 
-- @param eventType eventType attribute of &lt;attributeAssessment&gt; ncl element.
function AttributeAssessment:setEventType(eventType)
  self:addAttribute("eventType", eventType)
end

---
-- Returns the value of eventType attribute of &lt;attributeAssessment&gt; ncl element. 
-- @return eventType eventType attribute of the &lt;attributeAssessment&gt; ncl element.
function AttributeAssessment:getEventType()
  return self:getAttribute("eventType")
end

---
-- Sets a value to key attribute of &lt;attributeAssessment&gt; ncl element. 
-- @param key key attribute of &lt;attributeAssessment&gt; ncl element.
function AttributeAssessment:setKey(key)
  self:addAttribute("key", key)
end

---
-- Returns the value of key attribute of &lt;attributeAssessment&gt;</b> ncl element. 
-- @return key attribute of &lt;attributeAssessment&gt; ncl element.
function AttributeAssessment:getKey()
  return self:getAttribute("key")
end

---
-- Sets a value to attributeType attribute of &lt;attributeAssessment&gt; ncl element. 
-- @param attributeType attributeType attribute of &lt;attributeAssessment&gt; element.
function AttributeAssessment:setAttributeType(attributeType)
  self:addAttribute("attributeType", attributeType)
end

---
-- Returns the value of attributeType attribute of &lt;attributeAssessment&gt; ncl element. 
-- @return attributeType attribute of attributeAssessment&gt; ncl element.
function AttributeAssessment:getAttributeType()
  return self:getAttribute("attributeType")
end

---
-- Sets a value to offset attribute of &lt;attributeAssessment&gt; ncl element.
-- @param offset offset attribute of &lt;attributeAssessment&gt; element.
function AttributeAssessment:setOffset(offset)
  self:addAttribute("offset", offset)
end

---
-- Returns the value of offset attribute of &lt;attributeAssessment&gt; ncl element. 
-- @return offset attribute of &lt;attributeAssessment&gt; ncl element.
function AttributeAssessment:getOffset()
  return self:getAttribute("offset")
end

return AttributeAssessment