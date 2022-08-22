# concurrency control

## redlock-rb
- redlock-rb를 이용하여 동시성 제어 구현.
- spin lock 방식이기 때문에 retry count, delay, timeout 등의 값 조정이 필요. 정교하게 설정하지 않으면 버려지는 요청이 많아짐.
  - redisson과 같이 pub/sub 방식의 구현체는 없는가?

## puma
- worker 10개, thread 10개로 테스트 진행

## JMeter
- 테스트를 위해 JMeter 사용.  

| Number of Threads | Ramp-up period | Loop Count | stocks(shared resources) | remain(result) |  
| -- | -- | -- | -- | -- |
| 25 | 1 | 4 | 100 | 0 |
| 25 | 1 | 8 | 200 | 1(timeout) |
| 25 | 2 | 8 | 200 | 0 |
| 50 | 1 | 2 | 100 | 0 |
| 50 | 1 | 4 | 200 | 5(timeout) |
| 50 | 2 | 4 | 200 | 2(timeout) |
| 100 | 1 | 1 | 100 | 0 |
| 100 | 1 | 4 | 400 | 66(timeout) |
