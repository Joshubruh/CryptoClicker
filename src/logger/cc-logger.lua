local color = require "eansi"
local cc_logger = {}
function cc_logger.error(err)
  error = os.date (color "${bold red}[ERROR %X]~> ${bold_off white}"..err)
  print(error)
end
function cc_logger.debug(err)
  error = os.date (color "${bold blue}[DEBUG %X]~> ${bold_off white}"..err)
  print(error)
end
function cc_logger.info(err)
  error = os.date (color "${bold green}[INFO %X]~> ${bold_off white}"..err)
  print(error)
end
function cc_logger.warn(err)
  error = os.date (color "${bold yellow}[WARN %X]~> ${bold_off white}"..err)
  print(error)
end

return cc_logger
