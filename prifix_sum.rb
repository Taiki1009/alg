# 累積和
# 
# 典型問題
# - 多数の区間和クエリ
# - 2次元累積和で長方形領域の合計
# - 条件を 0/1 に写像して 個数/本数 を数える
# 
# 基本の考え方
# - 配列の先頭からの部分和を前計算しておくと、区間[l, r)の和は `prefix[r+1] - prefix[l]` でO(1)の計算量で済む
# - 「左に分解できる量」や「出現回数の累積」などに広く効く

# 問題
# 配列 A と Q 個のクエリが与えられる。各クエリで l r が与えられるので、区間 [l, r]（0-index） の総和を出力せよ。
# 
# input:
# 5 16
# 1 5 10 15 20
# 
# output:
# 4

# 方針: `prefix[i] = A[0] + ... + A[i-1]` を作り、`sum(l, r) = prefix[r+1]-prefix[l]`
# 計算量: 前計算 O(N)、各クエリ O(1)、全体 O(N+Q)
n, q = gets.chomp.split(' ').map(&:to_i)
a = gets.chomp.split(' ').map(&:to_i)

prefix = Array.new(n + 1, 0)
n.times { |i| prefix[i+1] = prefix[i] + a[i] }

q.times do
  l, r = gets.split(' ').map(&:to_i)
  puts prefix[r+1] - prefix[l]
end
