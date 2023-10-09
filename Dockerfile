FROM node:alpine as builder
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY ./ ./
# CMD ["npm", "run", "build"]
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/src/app/build /usr/share/nginx/html

#이미지 생성 : docker build -t jenny/docker-react .
# 실행 : docker run -p 8080:80 jenny/docker-react 
# 8080:80인 이유는 80번이 기본 포트이기 때문이다