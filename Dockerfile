FROM nginx:1.10.1-alpine
COPY index.html /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]


#user will automatically use 80, but user can specify what port they want to use so this isn't necessary
#EXPOSE 80/tcp , I do 8080 here though since rancher is using port 80

#if you want debug mode, do nginx-debug
#CMD ["nginx", "-g", "daemon off;"]
