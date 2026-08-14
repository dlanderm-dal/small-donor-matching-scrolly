#!/bin/bash
# Opens the Dataviz lessons progress map.
# The tracker has to READ "DATAVIZFINAL-MARKUP.html" to see what you've written,
# and browsers block that when a page is opened straight from Finder — so this
# starts a tiny local web server first.
#
# Close this Terminal window to stop the server.

cd "/Users/davidlanderman/UMD Drive/Github/small-donor-matching-scrolly" || exit 1

PORT=8773
MAP="http://localhost:$PORT/Dataviz%20lessons/LESSON-MAP.html"

echo ""
echo "  Dataviz lessons"
echo "  ---------------"
echo "  Progress map:   $MAP"
echo "  Annotated file: http://localhost:$PORT/DATAVIZFINAL-MARKUP.html"
echo ""
echo "  Leave this window open while you work. Close it to stop."
echo ""

# If something is already serving that port, just open the page.
if curl -s -o /dev/null "http://localhost:$PORT/" 2>/dev/null; then
  echo "  (a server was already running on port $PORT — reusing it)"
  open "$MAP"
  exit 0
fi

python3 -m http.server "$PORT" >/dev/null 2>&1 &
SERVER_PID=$!

# Stop the server when this window closes.
trap 'kill $SERVER_PID 2>/dev/null' EXIT

sleep 1
open "$MAP"
wait $SERVER_PID
