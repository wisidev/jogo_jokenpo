# Etapa 1: build do Flutter Web
FROM dart:stable AS build

# Instala Flutter
RUN git clone https://github.com/flutter/flutter.git /flutter
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Define canal estável
RUN flutter channel stable && flutter upgrade && flutter config --enable-web

# Cria pasta de app e copia os arquivos do projeto
WORKDIR /app
COPY . .

# Resolve dependências
RUN flutter pub get

# Gera build web
RUN flutter build web

# Etapa 2: container leve com nginx para servir
FROM nginx:alpine

# Remove conteúdo default do nginx
RUN rm -rf /usr/share/nginx/html/*

# Copia build gerado na etapa anterior
COPY --from=build /app/build/web /usr/share/nginx/html

# Expõe porta padrão do nginx
EXPOSE 80

# Comando padrão do nginx
CMD ["nginx", "-g", "daemon off;"]
