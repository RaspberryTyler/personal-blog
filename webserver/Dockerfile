FROM caddy:2.4.5-alpine as development

FROM "tylerlwsmith/tinkerlog-webapp:${BUILD_TAG:-latest}" as build
RUN bin/rails assets:precompile

FROM development as production
COPY --from=build /srv/app/public /srv/app/public
COPY Caddyfile /etc/caddy/Caddyfile