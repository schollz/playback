-- playback v0.0.1
-- play forward, play back
--
-- llllllll.co/t/playback
--
--
--
--    ▼ instructions below ▼
--
-- E2 changes rate
-- E3 changes position in time
-- K2 twice will loop, again stops
-- K3 goes to the live position

local shift=false
local playback=include("playback/lib/playback")

function init()
  playback.init()

  -- initialize metro for updating screen
  timer=metro.init()
  timer.time=1/15
  timer.count=-1
  timer.event=update_screen
  timer:start()
end

function update_screen()
  playback:update_state()
  redraw()
end

function key(k,z)
  if k==1 then
    shift=z==1
  end
  if z==0 then 
    do return end
  end
  if shift then
    if k==1 then
    elseif k==2 then
    else
    end
  else
    if k==1 then
    elseif k==2 then
      playback:toggle_loop()
    else
      playback:frontier()         
    end
  end
end

function enc(k,d)
  if shift then
    if k==1 then
    elseif k==2 then
    else
    end
  else
    if k==1 then
    elseif k==2 then
      playback:change_rate(d)
    else
      playback:change_pos(d)
    end
  end
end

function redraw()
  screen.clear()
  playback:redraw()
  screen.update()
end

function rerun()
  norns.script.load(norns.state.script)
end
