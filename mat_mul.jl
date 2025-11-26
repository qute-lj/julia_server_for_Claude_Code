# 矩阵乘法性能测试
# 20x20 矩阵乘法示例

using LinearAlgebra
using BenchmarkTools

println("🔢 20x20 矩阵乘法性能测试")
println("=" ^ 40)

# 创建两个20x20的随机矩阵
println("📊 创建测试矩阵...")
A = rand(20, 20)
B = rand(20, 20)

println("✅ 矩阵创建完成")
println("   矩阵A: $(size(A))")
println("   矩阵B: $(size(B))")

# 显示矩阵的一些基本信息
println("\n📈 矩阵统计信息:")
println("   A矩阵元素和: $(sum(A))")
println("   B矩阵元素和: $(sum(B))")
println("   A矩阵最大值: $(maximum(A))")
println("   B矩阵最大值: $(maximum(B))")

# 执行矩阵乘法
println("\n🚀 执行矩阵乘法 C = A * B ...")
@time C = A * B

println("✅ 矩阵乘法完成")
println("   结果矩阵C: $(size(C))")
println("   C矩阵元素和: $(sum(C))")
println("   C矩阵最大值: $(maximum(C))")
println("   C矩阵最小值: $(minimum(C))")

# 使用BenchmarkTools进行更精确的性能测试
println("\n⏱️  BenchmarkTools 性能测试:")
println("执行 @benchmark A*B ...")

benchmark_result = @benchmark A*B samples=100 evals=1

println("✅ 性能测试完成")
println("   最小时间: $(benchmark_result.times |> minimum) ns")
println("   最大时间: $(benchmark_result.times |> maximum) ns")
println("   平均时间: $(mean(benchmark_result.times)) ns")
println("   中位数时间: $(median(benchmark_result.times)) ns")
println("   内存分配: $(benchmark_result.memory) bytes")
println("   分配次数: $(benchmark_result.allocs)")

# 计算GFLOPS (每秒十亿次浮点运算)
n = size(A, 1)
flops = 2 * n^3  # 矩阵乘法的浮点运算次数
avg_time_seconds = mean(benchmark_result.times) / 1e9
gflops = flops / avg_time_seconds / 1e9

println("\n📊 性能指标:")
println("   浮点运算次数: $(flops)")
println("   平均执行时间: $(round(avg_time_seconds * 1000, digits=3)) ms")
println("   计算性能: $(round(gflops, digits=2)) GFLOPS")

# 验证结果的正确性
println("\n🔍 验证计算结果:")
# 手动计算几个元素验证
manual_c11 = sum(A[1,:] .* B[:,1])
auto_c11 = C[1,1]
println("   C[1,1] 手动计算: $(round(manual_c11, digits=6))")
println("   C[1,1] 矩阵乘法: $(round(auto_c11, digits=6))")
println("   误差: $(abs(manual_c11 - auto_c11))")

println("\n🎉 矩阵乘法测试完成！")
println("💡 这个测试展示了Julia在数值计算方面的高性能")