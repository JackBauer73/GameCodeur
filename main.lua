slotX = 400
slotY = 100

slotEquipX = 100
slotEquipY = 100

function love.load()
   
  slot_Inventaire = love.graphics.newImage("images/Wooden_UI_png/frame_c3_01.png")
  slot_InventaireH = slot_Inventaire:getHeight()
  slot_InventaireW = slot_Inventaire:getWidth()

  slot_Equipement = love.graphics.newImage("images/Wooden_UI_png/frame_c2_01.png")
  slot_EquipementH = slot_Equipement:getHeight()
  slot_EquipementW = slot_Equipement:getWidth()
  
  objet = love.graphics.newImage("images/Wooden_UI_png/skull_01.png")
  objetH = objet:getHeight()
  objetW = objet:getWidth()
  
  slot = {
    x = slotX,
    y = slotY,
    width = objetW,
    height = objetH,
    dragging = { active = false, diffX = 0, diffY = 0 }
    }

end

function love.update(dt)
  if slot.dragging.active then
    slot.x = love.mouse.getX() - slot.dragging.diffX
    slot.y = love.mouse.getY() - slot.dragging.diffY
  end
end

function love.draw()
  love.graphics.draw(slot_Equipement, slotEquipX, slotEquipY,0,1,1,slot_EquipementW/2,slot_EquipementH/2)
  love.graphics.draw(slot_Inventaire, slotX, slotY,0,1,1,slot_InventaireW/2,slot_InventaireH/2)
  love.graphics.draw(objet, slot.x, slot.y,0,1,1,objetW/2,objetH/2)

end

function love.mousepressed(x, y, button)
  if button == 1
  and x > slot.x and x < slot.x + slot.width
  and y > slot.y and y < slot.y + slot.height
  then
    slot.dragging.active = true
    slot.dragging.diffX = x - slot.x
    slot.dragging.diffY = y - slot.y
  end
end

function love.mousereleased(x, y, button)
  if button == 1 
  and x > slotEquipX and x < slotEquipX + slot_EquipementW
  and y > slotEquipY and y < slotEquipY + slot_EquipementH
  then slot.dragging.active = false end
end
