# Sử dụng Alpine Linux để nhẹ nhất
FROM alpine:latest

# Cài đặt Xray-core
RUN apk add --no-cache curl && \
    curl -Ls https://raw.githubusercontent.com/XTLS/Xray-install/main/install-release.sh | sh

# Tạo thư mục config
RUN mkdir -p /etc/xray

# Copy file cấu hình vào container
COPY config.json /etc/xray/config.json

# Mở cổng
EXPOSE 80 443

# Chạy Xray-core
CMD ["/usr/local/bin/xray", "-config", "/etc/xray/config.json"]
