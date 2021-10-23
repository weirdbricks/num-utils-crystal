# num-utils in Crystal Lang
[num-utils inspired](https://suso.suso.org/programs/num-utils/index.phtml) tools written in Crystal Lang.

# Compile

You'll need Crystal Lang - this is tested with `1.2.1`

```
crystal build /path/to/numsum-crystal.cr --static --release --progress
```

# Usage examples:

## Generate a text file with random numbers in it

```
for i in {1..10}; do echo $RANDOM >> test.txt; done
cat test.txt 
1126
31446
12418
12323
22716
14055
2050
19221
3488
11834
```

## To get the summary:

```
cat test.txt | ./numsum-crystal 
130677
```

# Comparison to `numsum` from the original num-utils:

## Generate a text file with ten million numbers in it:

```
for i in {1..10000000}; do echo $RANDOM >> /dev/shm/test.txt; done
```

## Benchmark with numsum: 

```
for i in {1..10}; do SECONDS=0; cat test.txt | numsum; echo "Seconds: ${SECONDS}"; done
163833895278
Seconds: 31
163833895278
Seconds: 32
163833895278
Seconds: 32
163833895278
Seconds: 32
163833895278
Seconds: 31
163833895278
Seconds: 31
163833895278
Seconds: 33
163833895278
Seconds: 31
163833895278
Seconds: 31
163833895278
Seconds: 31
```

## Benchmark with numsum-crystal: 

```
for i in {1..10}; do SECONDS=0; cat test.txt | ./numsum-crystal; echo "Seconds: ${SECONDS}"; done
163833895278.0
Seconds: 0
163833895278.0
Seconds: 1
163833895278.0
Seconds: 1
163833895278.0
Seconds: 1
163833895278.0
Seconds: 1
163833895278.0
Seconds: 1
163833895278.0
Seconds: 1
163833895278.0
Seconds: 1
163833895278.0
Seconds: 0
163833895278.0
Seconds: 1
```
