연산자

사칙 연산자: +, -, *, / : 이항연산자
삼항 연산자: ?  1==1 ? true일때 실행 : false일때 실행;

SQL연산자 
= 연사자: 컬럼|표현식 = 값 ==> 이항 연산자
 
IN : 컬럼|표현식 IN (집합)
    deptno IN (10,30) ==> IN (10,30), deptno(10,30) --오른쪽처럼 쓰면 안됨
    
EXISTS 연산자
사용방법: EXISTS (서브쿼리)
서브쿼리의 조회결과가 한건이라도 있으면 참(TRUE)
잘못된 사용방법 : WHERE deptno EXISTS (서브쿼리)

메인쿼리의 값과 관계없이 서브쿼리의 실행 결과는 항상 존재 하기 때문에 
emp 테이블의 모든 데이터가 조회된다

아래 쿼리는 비상호 서브쿼리
일반적으로 EXISTS 연산자는 상호연관 서브쿼리로 많이 사용

EXISTS 연산자의 장점
만족하는 행을 하나라도 발견을 하면 더이상 탐색을 하지 않고 중단
행의 존재 여부에만 관심이 있을 때 사용
SELECT *
FROM emp
WHERE EXISTS (SELECT 'X'
              FROM dept);
              
매니저가 없는 직원 : KING
매니저 정보가 존재하는 직원: 14-KING =13명의 직원

EXISTS 연산자를 활용하여 조회
SELECT *
FROM emp e
WHERE EXISTS (SELECT 'X'
              FROM emp m
              WHERE e.mgr = m.empno);

IS NOT NULL 을 통해서도 동일한 결과를 만들어 낼 수 있다.
SELECT *
FROM emp
WHERE mgr IS NOT NULL;

JOIN
SELECT *
FROM emp e, emp m
WHERE e.mgr = m.empno;

sub 9]
SELECT *
FROM product p
WHERE EXISTS (SELECT 'X'
              FROM cycle c
              WHERE cid = 1
                AND c.pid = p.pid);
              
sub 10]  exist쓸때 부정형은 not
SELECT *
FROM product p
WHERE NOT EXISTS (SELECT 'X'
                  FROM cycle c
                  WHERE cid = 1
                  AND c.pid = p.pid);
                  
집합연산
합집합
{1, 5, 3} U {2, 3} = {1, 2, 3, 5}

SQL에만 존재하는 UNION ALL (중복 데이터를 제거하지 않는다)
{1, 5, 3} U {2, 3} = {1, 5, 3, 2, 3}

교집합
{1, 5, 3} 교집합 {2, 3} = {3}

차집합
{1, 5, 3} 차집합 {2, 3} = {1, 5}

SQL에서의 집합연산
연산자: UNION, UNION ALL, INTERSECT, MINUS
두개의 SQL의 실행결과를 행을 확장 (위, 아래로 결합 된다)

UNION 연산자: 중복제거(수학적 개념의 집합과 동일)

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698, 7369)

UNION

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698)

UNION ALL 연산자 : 중복허용

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698, 7369)

UNION ALL

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698)

INTERSECT 교집합: 두 집합간 중복되는 요소만 조회

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698, 7369)

INTERSECT

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698)

MINUS 연산자 : 위쪽 집합에서 아래쪽 집합 요소를 제거

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698, 7369)

MINUS

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698)


SQL 집합연산자의 특징

열의 이름: 첫번 째 SQL 의 컬럼을 따라간다

첫번째 쿼리의 컬럼명에 별칭 부여 (위쪽에 있는 알리아스를 따라가서 조회된다)
SELECT ename nm, empno no
FROM emp
WHERE empno IN (7369)
UNION
SELECT ename, empno
FROM emp
WHERE empno IN (7698)

2. 정렬을 하고 싶을 경우 마지막에 적용 가능
   개별 SQL에는 ORDER BY 불가 (인라인 뷰를 사용하여 메인쿼리에서 ORDER BY 가 기술되지 않으면 가능)
SELECT ename nm, empno no
FROM emp
WHERE empno IN (7369)
--ORDER BY nm, 중간쿼리에 정렬 불가, 마지막에 정렬을 해야한다.
UNION
SELECT ename, empno
FROM emp
WHERE empno IN (7698)   
ORDER BY nm;   

3. SQL 의 집합 연산자는 중복을 제거한다(수학적 집합 개념과 동일), UNION ALL 은 중복 허용   
   
4. 두개의 집합에서 중복을 제거하기 위해 각각의 집합을 정렬하는 작업이 필요
    ==> 사용자에게 결과를 보내주는 반응성이 느려짐
        ==> UNION ALL 을 사용할 수 있는 상황일 경우 UNION 을 사용하지 않아야 
            속도적인 측면에서 유리하다

알고리즘(정렬- 버블, 삽입정렬,......
           자료 구조: 트리구조(이진 트리, 밸런스 트리)
                     heap
                     stack, queue
                     list ...
집합연산자에서 중요한 사항 : 중복제거
중복이 없다면 union all 사용하는게 빠르다
버거킹 갯수 + 맥날 개수+ KFC / 롯데
각 시군구에서 버거킹의 개수가 높은곳
사용된 SQL 문법 : WHERE, 그룹연산을 위한 GROUP BY, MULTIROW함수(COUNT), 
                인라인뷰, ROWNUM, ORDER BY, 별칭(컬럼, 테이블), ROUND,
                JOIN
                
SELECT ROWNUM rn, ham.sido, ham.sigungu, ham.city_idx
FROM 
((SELECT bk.sido, bk.sigungu, bk.cnt, kfc.cnt, mac.cnt, lot.cnt,
        ROUND ((bk.cnt + kfc.cnt + mac.cnt)/ lot.cnt, 2) city_idx
FROM
(SELECT sido, sigungu, COUNT(*)cnt
FROM FASTFOOD
WHERE gb = '버거킹'
GROUP BY sido, sigungu) bk,

(SELECT sido, sigungu, COUNT(*)cnt
FROM FASTFOOD
WHERE gb = '맥도날드'
GROUP BY sido, sigungu) mac,

(SELECT sido, sigungu, COUNT(*)cnt
FROM FASTFOOD
WHERE gb = 'KFC'
GROUP BY sido, sigungu) kfc,

(SELECT sido, sigungu, COUNT(*)cnt
FROM FASTFOOD
WHERE gb = '롯데리아'
GROUP BY sido, sigungu) lot

WHERE bk.sido = mac.sido
  AND bk.sigungu = mac.sigungu
  AND bk.sido = kfc.sido
  AND bk.sigungu = kfc.sigungu
  AND bk.sido = lot.sido
  AND bk.sigungu = lot.sigungu
ORDER BY city_idx desc) a)ham

(SELECT ROWNUM rn, a.*
 FROM
(SELECT sido, sigungu, sal, people, ROUND(sal/people, 2) jisu
 FROM tax
 GROUP BY sido, sigungu, sal, people
 ORDER BY jisu DESC)a) gukse
 
 WHERE ham.rn = gukse.rn;




1.
SELECT ROWNUM rn, a.*
 FROM
(SELECT sido, sigungu, sal, people, ROUND(sal/people, 2) jisu
 FROM tax
 GROUP BY sido, sigungu, sal, people
 ORDER BY jisu DESC)a;



3.
SELECT ROWNUM rn, a.sido, a.sigungu, a.city_idx
FROM 
(SELECT bk.sido, bk.sigungu, bk.cnt, kfc.cnt, mac.cnt, lot.cnt,
        ROUND ((bk.cnt + kfc.cnt + mac.cnt)/ lot.cnt, 2) city_idx
FROM
(SELECT sido, sigungu, COUNT(*)cnt
FROM FASTFOOD
WHERE gb = '버거킹'
GROUP BY sido, sigungu) bk,

(SELECT sido, sigungu, COUNT(*)cnt
FROM FASTFOOD
WHERE gb = '맥도날드'
GROUP BY sido, sigungu) mac,

(SELECT sido, sigungu, COUNT(*)cnt
FROM FASTFOOD
WHERE gb = 'KFC'
GROUP BY sido, sigungu) kfc,

(SELECT sido, sigungu, COUNT(*)cnt
FROM FASTFOOD
WHERE gb = '롯데리아'
GROUP BY sido, sigungu) lot,


(SELECT ROWNUM, a.*
 FROM
(SELECT sido, sigungu, sal, people, ROUND(sal/people, 2) jisu
 FROM tax
 GROUP BY sido, sigungu, sal, people
 ORDER BY jisu DESC)a) tax

WHERE bk.sido = mac.sido
  AND bk.sigungu = mac.sigungu
  AND bk.sido = kfc.sido
  AND bk.sigungu = kfc.sigungu
  AND bk.sido = lot.sido
  AND bk.sigungu = lot.sigungu
  AND fastfood.ID = tax.ID
ORDER BY city_idx desc) a;


과제1] fastfood 테이블과 tax 테이블을 이용하여 다음과 같이 조회되도록 sql작성
1. 시도 시군구별 도시발전지수를 구하고 (지수가 높은 도시가 순위가 높다) 
2. 인당 연말 신고액이 높은 시도 시군구별로 순위를 구하여
3. 도시발전지수와 인당 신고액 순위가 같은 데이터 끼리 조인하여 아래와 같이 컬림이 조회되도록 sql 작성
순위, 햄버거 시도, 햄버거 시군구, 햄버거 도시발전지수, 국세청 시도, 국세청 시군구, 국세청 연말정산 금액1인당 신고액

과제2] 
햄버거 도시발전지수를 구하기 위해 4개의 인라인 뷰를 사용 하였는데 (fastfood 테이블을 4번사용)
이를 개선하여 테이블을 한번만 읽는 형태로 쿼리를 개선(fastfood 테이블을 1번만 사용)
case, decode 사용해서,,,


햄버거지수 sql을 다른형태로 도전하기
인프런(크롤링 배우는 사이트)

과제3] 
fastfood 테이블 한번만 읽고 도시발전 지수 구하기;
개별 햄버거점의 주소(파파이스 , 맘스터치 제외하고 계산) --(해당 영업점이 롯데리아 이면 1), (해당 영업점이 kfc 이면 1)

--오더바이가 먼저되고 그다음 로우넘이 되니까 로우넘을 밖으로 빼서 쿼리작성
SELECT ROWNUM rank, sido, sigungu, city_idx
FROM
(SELECT sido, sigungu, ROUND((kfc + mac + bk) / lot, 2) city_idx
FROM
(SELECT sido, sigungu, NVL(SUM (CASE WHEN gb = '롯데리아' THEN 1 END), 1) lot,
                       NVL(SUM (CASE WHEN gb = '맥도날드' THEN 1 END), 0) mac,
                       NVL(SUM (CASE WHEN gb = 'kfc'     THEN 1 END), 0) kfc,
                       NVL(SUM (CASE WHEN gb = '버거킹'   THEN 1 END), 0) bk
FROM fastfood
WHERE gb IN ('버거킹', 'KFC', '맥도날드', '롯데리아')
GROUP BY sido, sigungu)
ORDER BY city_idx DESC);

과제1]
SELECT ROWNUM rank, sido, sigungu, tax
FROM
    (SELECT sido, sigungu, ROUND(sal/people, 2) tax
     FROM tax
     ORDER BY tax DESC);


조인]
SELECT b.rank, a.sido, a.sigungu, a.city_idx, b.sido, b.sigungu, tax
FROM
(SELECT ROWNUM rank, sido, sigungu, city_idx
FROM
(SELECT sido, sigungu, ROUND((kfc + mac + bk) / lot, 2) city_idx
FROM
(SELECT sido, sigungu, NVL(SUM (CASE WHEN gb = '롯데리아' THEN 1 END), 1) lot,
                       NVL(SUM (CASE WHEN gb = '맥도날드' THEN 1 END), 0) mac,
                       NVL(SUM (CASE WHEN gb = 'kfc'     THEN 1 END), 0) kfc,
                       NVL(SUM (CASE WHEN gb = '버거킹'   THEN 1 END), 0) bk
FROM fastfood
WHERE gb IN ('버거킹', 'KFC', '맥도날드', '롯데리아')
GROUP BY sido, sigungu)
ORDER BY city_idx DESC))a,

(SELECT ROWNUM rank, sido, sigungu, tax
FROM
    (SELECT sido, sigungu, ROUND(sal/people, 2) tax
     FROM tax
     ORDER BY tax DESC))b
WHERE a.rank(+) = b.rank
ORDER BY b.rank;

3번과제]
CASE 두번만쓰기 COUNT 함수로

SELECT 시도, 시군구, (KFC 스칼라 서브쿼리), (버거킹 스칼라 서브쿼리), (....)
FROM ....




















