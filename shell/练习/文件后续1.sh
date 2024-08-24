#!/bin/bash
#!/bin/bash

# 参数验证
if [[ -z "$1" ]] || [[ -z "$2" ]]; then
    echo "Usage: $0 <src_extension> <dest_extension>"
    exit 1
fi

src1=$1
des=$2

# 安全性检查
if ! [[ "$src1" =~ ^[a-zA-Z0-9_]+$ ]] || ! [[ "$des" =~ ^[a-zA-Z0-9_]+$ ]]; then
    echo "Error: Extensions must not contain special characters."
    exit 1
fi

# 边界条件处理
if [[ "$src1" == "$des" ]]; then
    echo "No need to rename files as extensions are the same."
    exit 0
fi

# 执行重命名
for file in *."$src1"; do
    mv "$file" "${file%.*}.$des"
done

# 错误处理
if [ $? -ne 0 ]; then
    echo "An error occurred during renaming."
    exit 1
fi

echo "Renaming completed successfully."