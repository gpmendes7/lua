---
-- Implements <a href="http://handbook.ncl.org.br/doku.php?id=assessmentstatement"/>&lt;assessmentstatement&gt;</a> ncl element.
-- @module AssessmentStatement
-- @author Gabriel Pereira Mendes
-- @copyright <a href="https://eic.cefet-rj.br/~gpmm/"/>Grupo de Pesquisa em Multimídia</a>  2017-2023
-- @alias AssessmentStatement

local NCLElem = require "src/core/NCLElem"
local AttributeAssessment = require "src/core/connectors/AttributeAssessment"
local ValueAssessment = require "src/core/connectors/ValueAssessment"

local AssessmentStatement = NCLElem:extends()

---
-- Name of &lt;assessmentstatement&gt; ncl element.
AssessmentStatement.nameElem = "assessmentStatement"

---
-- List with maps to associate classes representing children elements from &lt;assessmentstatement&gt; ncl element.
-- @field attributeAssessment list where second item expresses cardinality of &lt;assessmentstatement&gt; ncl child element (many).
-- @field valueAssessment list where second item expresses cardinality of &lt;valueAssessment&gt; ncl child element (one).
-- @table childrenMap
AssessmentStatement.childrenMap = {
  attributeAssessment = {AttributeAssessment, "many"},
  valueAssessment = {ValueAssessment, "one"}
}

---
-- List containing the data types of each attribute belonging to &lt;assessmentstatement&gt; element.
-- @field comparator type of comparator attribute (string).
-- @table attributesTypeMap
AssessmentStatement.attributesTypeMap = {
  comparator = "string"
}

---
-- List containing all possible pre-definied values to string attributes belonging to &lt;assessmentstatement&gt; ncl element. 
-- @field comparator list with possible values to comparator attribute ("eq", "ne", "gt", "lt", "gte" or "lte").
-- @table attributesStringValueMap
AssessmentStatement.attributesStringValueMap = {
  comparator = {"eq", "ne", "gt", "lt", "gte", "lte"}
}

---
-- Returns a new AssessmentStatement object. 
-- If full flag is not nil, the object will receive default children objects of each children class.
-- This case, full must be passed to the method with a valid number.  
-- @param attributes list of attributes to be initialized.
-- @param full numeric flag to indicate if the object will be created with filled children list.
-- @return new AssessmentStatement object created.
function AssessmentStatement:create(attributes, full)
  local assessmentStatement = AssessmentStatement:new()

  assessmentStatement.comparator = nil

  if(attributes ~= nil)then
    assessmentStatement:setAttributes(attributes)
  end

  assessmentStatement.children = {}
  assessmentStatement.attributeAssessments = {}

  if(full ~= nil)then
    assessmentStatement:addAttributeAssessment(AttributeAssessment:create())
    assessmentStatement:setValueAssessment(ValueAssessment:create())
  end

  return assessmentStatement
end

---
-- Sets a value to comparator attribute of &lt;assessmentStatement&gt; ncl element.
-- @param comparator comparator attribute of &lt;assessmentStatement&gt; ncl element.
function AssessmentStatement:setComparator(comparator)
  self:addAttribute("comparator", comparator)
end

---
-- Returns the value of comparator attribute of &lt;assessmentStatement&gt; ncl element. 
-- @return comparator attribute of &lt;assessmentStatement&gt; ncl element.
function AssessmentStatement:getComparator()
  return self:getAttribute("comparator")
end

---
-- Adds a &lt;attributeAssessment&gt; ncl child element of &lt;assessmentStatement&gt; ncl element.
-- @param attributeAssessment object representing the &lt;attributeAssessment&gt; ncl element.
function AssessmentStatement:addAttributeAssessment(attributeAssessment)
  if((type(attributeAssessment) == "table"
    and attributeAssessment["getNameElem"] ~= nil
    and attributeAssessment:getNameElem() ~= "attributeAssessment")
    or (type(attributeAssessment) == "table"
    and attributeAssessment["getNameElem"] == nil)
    or type(attributeAssessment) ~= "table")then
    error("Error! Invalid attributeAssessment element!", 2)
  end

  local p = self:getPosAvailable("attributeAssessment")

  if(p ~= nil)then
    self:addChild(attributeAssessment, p)
  else
    self:addChild(attributeAssessment, 1)
  end

  table.insert(self.attributeAssessments, attributeAssessment)
end

---
-- Returns a &lt;attributeAssessments&gt; ncl child element of &lt;assessmentStatement&gt; ncl element in position p.
-- @param p  position of the object representing the &lt;attributeAssessments&gt; ncl element.
function AssessmentStatement:getAttributeAssessmentPos(p)
  if(self.attributeAssessments == nil)then
    error("Error! assessmentStatement element with nil attributeAssessments list!", 2)
  elseif(p > #self.attributeAssessments)then
    error("Error! assessmentStatement element doesn't have an attributeAssessment child in position "..p.."!", 2)
  end

  return self.attributeAssessments[p]
end

---
-- Adds so many &lt;attributeAssessment&gt; ncl child elements of &lt;assessmentStatement&gt; ncl element passed as parameters.
-- @param ... objects representing the &lt;attributeAssessment&gt; ncl element.
function AssessmentStatement:setAttributeAssessments(...)
  if(#arg>0)then
    for _, attributeAssessment in ipairs(arg) do
      self:addAttributeAssessment(attributeAssessment)
    end
  end
end

---
-- Removes a &lt;attributeAssessment&gt; ncl child element of &lt;assessmentStatement&gt; ncl element. 
-- @param attributeAssessment object representing the &lt;attributeAssessment&gt; ncl element.
function AssessmentStatement:removeAttributeAssessment(attributeAssessment)
  if((type(attributeAssessment) == "table"
    and attributeAssessment["getNameElem"] ~= nil
    and attributeAssessment:getNameElem() ~= "attributeAssessment")
    or (type(attributeAssessment) == "table"
    and attributeAssessment["getNameElem"] == nil)
    or type(attributeAssessment) ~= "table")then
    error("Error! Invalid attributeAssessment element!", 2)
  elseif(self.children == nil)then
    error("Error! assessmentStatement element with nil children list!", 2)
  elseif(self.attributeAssessments == nil)then
    error("Error! assessmentStatement element with nil attributeAssessments list!", 2)
  end

  self:removeChild(attributeAssessment)

  for p, aa in ipairs(self.attributeAssessments) do
    if(attributeAssessment == aa)then
      table.remove(self.attributeAssessments, p)
    end
  end
end

---
-- Removes a &lt;attributeAssessment&gt; ncl child element of &lt;assessmentStatement&gt; ncl element in position p.
-- @param p position of &lt;attributeAssessment&gt; ncl child element.
function AssessmentStatement:removeAttributeAssessmentPos(p)
  if(self.children == nil)then
    error("Error! assessmentStatement element with nil children list!", 2)
  elseif(self.attributeAssessments == nil)then
    error("Error! assessmentStatement element with nil attributeAssessments list!", 2)
  elseif(p > #self.children)then
    error("Error! assessmentStatement element doesn't have a attributeAssessment child in position "..p.."!", 2)
  elseif(p > #self.attributeAssessments)then
    error("Error! assessmentStatement element doesn't have a attributeAssessment child in position "..p.."!", 2)
  end

  self:removeChild(self.attributeAssessments[p])
  table.remove(self.attributeAssessments, p)
end

---
-- Sets the &lt;valueAssessment&gt; child element of &lt;assessmentStatement&gt; ncl element. 
-- @param valueAssessment object representing the &lt;valueAssessment&gt; ncl element.
function AssessmentStatement:setValueAssessment(valueAssessment)
  if((type(valueAssessment) == "table"
    and valueAssessment["getNameElem"] ~= nil
    and valueAssessment:getNameElem() ~= "valueAssessment")
    or (type(valueAssessment) == "table"
    and valueAssessment["getNameElem"] == nil)
    or type(valueAssessment) ~= "table")then
    error("Error! Invalid valueAssessment element!", 2)
  end

  local p

  if(self.valueAssessment == nil)then
    p = self:getPosAvailable("attributeAssessment")
    if(p ~= nil)then
      self:addChild(valueAssessment, p)
    else
      self:addChild(valueAssessment, 1)
    end
  else
    p = self:getPosAvailable("valueAssessment") - 1
    self:removeChildPos(p)
    self:addChild(valueAssessment, p)
  end

  self.valueAssessment = valueAssessment
end

---
-- Returns the &lt;valueAssessment&gt; child element of &lt;assessmentStatement&gt; ncl element.
-- @return valueAssessment object representing the &lt;valueAssessment&gt; ncl element.
function AssessmentStatement:getValueAssessment()
  return self.valueAssessment
end

---
-- Removes the &lt;valueAssessment&gt; ncl child element of &lt;assessmentStatement&gt; ncl element.
function AssessmentStatement:removeValueAssessment()
  self:removeChild(self.valueAssessment)
  self.valueAssessment = nil
end

return AssessmentStatement