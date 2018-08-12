local http = game:GetService("HttpService")

local addToast = require(script.Parent.addToast)
local removeToast = require(script.Parent.removeToast)

return function(timeout, title, body)
  return function(store)
    local id = http:GenerateGUID()

    store:dispatch(addToast(id, title, body))

    spawn(function()
      wait(timeout)
      store:dispatch(removeToast(id))
    end)
  end
end
