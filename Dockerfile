FROM openresty/openresty:xenial

# Test dependencies
# The specs are actually for src/statsd.lua, which relies on luasocket
# rather than openresty cosocket.
RUN luarocks install busted
RUN luarocks install luasocket

COPY . .
RUN luarocks make
CMD ["busted"]
