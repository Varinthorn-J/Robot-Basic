from numpy.random import seed
from numpy.random import randint
import random
from rediscluster import RedisCluster
import redis
 
def generate_random_numbers():
    for i in range(10):
      values = random.randint(0, 9999999)

    return values

# def Tize_Redis_Conn_lib(config_host, config_port, ):
#     r = RedisCluster(host=config_host, port=config_port, skip_full_coverage_check=True)
#     return r
 
# def Tize_Redis_Conn(host,port, password):  
#    rc = RedisCluster(host=host, port=port, password=password ,decode_responses=True,skip_full_coverage_check=True)
#    return rc
 
def rediss(host, password): 
  pool = redis.ConnectionPool(host=host, port=6379, db=0, password=password)
  redis_connect = redis.Redis(connection_pool=pool)
  # r.set('AAA','bar')
  # r.get('foo')
  # r.keys('123') 
  # pool.set('foo','bar')
  # value = pool.get('foo')
  # print(value) 
  return redis_connect