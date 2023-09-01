FROM node:lts AS runtime
WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

COPY --from=build /app/dist /app/dist
COPY --from=build /app/node_modules /app/node_modules
COPY --from=build /app/package*.json /app/

ENV NODE_ENV production

ENV HOST=0.0.0.0
ENV PORT=3000
EXPOSE 3000
CMD node ./dist/entry.mjs
