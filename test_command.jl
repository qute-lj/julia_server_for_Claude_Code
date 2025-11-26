# 测试与Julia服务器的通信

# 包含助手模块
include("JuliaREPLHelper.jl")
using .JuliaREPLHelper

println("🧪 测试Julia服务器通信")

# 测试1: 简单数学运算
println("\n📊 测试1: 简单数学运算")
response1 = send_command("2 + 2")
println("2 + 2 = $response1")

# 测试2: FFT演示
println("\n🎵 测试2: FFT演示")
response2 = send_command("demo")
println("FFT演示结果: $response2")

# 测试3: 测试包加载
println("\n📦 测试3: 测试包加载")
response3 = send_command("test_packages")
println("包测试结果: $response3")

println("\n✅ 所有测试完成！")