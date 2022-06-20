# X \le 5
pbinom(5, 10, 0.6)

# X < 5
pbinom(4, 10, 0.6)

# X > 4
1 - pbinom(4, 10, 0.6)

# X = 5
pbinom(5, 10, 0.6) - pbinom(4, 10, 0.6)