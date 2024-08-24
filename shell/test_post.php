<?php
// 检查是否收到POST请求
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // 检查是否收到名为"abc"的POST参数
    if (isset($_POST['abc'])) {
        $abcValue = $_POST['abc'];
        // 直接返回接收到的数值
        echo $abcValue;
    } else {
        echo '缺少参数abc';
    }
} else {
    echo '请使用POST方法访问';
}
?>