FROM headscale/headscale:stable AS headscale

FROM tailscale/tailscale:latest

RUN apk add --no-cache jq

COPY --from=headscale /ko-app/headscale /usr/local/bin/headscale
COPY --chmod=555 init.sh /usr/local/bin/init.sh

CMD [ "/usr/local/bin/init.sh" ]
