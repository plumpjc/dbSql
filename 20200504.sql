������

��Ģ ������: +, -, *, / : ���׿�����
���� ������: ?  1==1 ? true�϶� ���� : false�϶� ����;

SQL������ 
= ������: �÷�|ǥ���� = �� ==> ���� ������
 
IN : �÷�|ǥ���� IN (����)
    deptno IN (10,30) ==> IN (10,30), deptno(10,30) --������ó�� ���� �ȵ�
    
EXISTS ������
�����: EXISTS (��������)
���������� ��ȸ����� �Ѱ��̶� ������ ��(TRUE)
�߸��� ����� : WHERE deptno EXISTS (��������)

���������� ���� ������� ���������� ���� ����� �׻� ���� �ϱ� ������ 
emp ���̺��� ��� �����Ͱ� ��ȸ�ȴ�

�Ʒ� ������ ���ȣ ��������
�Ϲ������� EXISTS �����ڴ� ��ȣ���� ���������� ���� ���

EXISTS �������� ����
�����ϴ� ���� �ϳ��� �߰��� �ϸ� ���̻� Ž���� ���� �ʰ� �ߴ�
���� ���� ���ο��� ������ ���� �� ���
SELECT *
FROM emp
WHERE EXISTS (SELECT 'X'
              FROM dept);
              
�Ŵ����� ���� ���� : KING
�Ŵ��� ������ �����ϴ� ����: 14-KING =13���� ����

EXISTS �����ڸ� Ȱ���Ͽ� ��ȸ
SELECT *
FROM emp e
WHERE EXISTS (SELECT 'X'
              FROM emp m
              WHERE e.mgr = m.empno);

IS NOT NULL �� ���ؼ��� ������ ����� ����� �� �� �ִ�.
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
              
sub 10]  exist���� �������� not
SELECT *
FROM product p
WHERE NOT EXISTS (SELECT 'X'
                  FROM cycle c
                  WHERE cid = 1
                  AND c.pid = p.pid);
                  
���տ���
������
{1, 5, 3} U {2, 3} = {1, 2, 3, 5}

SQL���� �����ϴ� UNION ALL (�ߺ� �����͸� �������� �ʴ´�)
{1, 5, 3} U {2, 3} = {1, 5, 3, 2, 3}

������
{1, 5, 3} ������ {2, 3} = {3}

������
{1, 5, 3} ������ {2, 3} = {1, 5}

SQL������ ���տ���
������: UNION, UNION ALL, INTERSECT, MINUS
�ΰ��� SQL�� �������� ���� Ȯ�� (��, �Ʒ��� ���� �ȴ�)

UNION ������: �ߺ�����(������ ������ ���հ� ����)

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698, 7369)

UNION

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698)

UNION ALL ������ : �ߺ����

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698, 7369)

UNION ALL

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698)

INTERSECT ������: �� ���հ� �ߺ��Ǵ� ��Ҹ� ��ȸ

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698, 7369)

INTERSECT

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698)

MINUS ������ : ���� ���տ��� �Ʒ��� ���� ��Ҹ� ����

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698, 7369)

MINUS

SELECT empno, ename
FROM emp
WHERE empno IN (7566, 7698)


SQL ���տ������� Ư¡

���� �̸�: ù�� ° SQL �� �÷��� ���󰣴�

ù��° ������ �÷����� ��Ī �ο� (���ʿ� �ִ� �˸��ƽ��� ���󰡼� ��ȸ�ȴ�)
SELECT ename nm, empno no
FROM emp
WHERE empno IN (7369)
UNION
SELECT ename, empno
FROM emp
WHERE empno IN (7698)

2. ������ �ϰ� ���� ��� �������� ���� ����
   ���� SQL���� ORDER BY �Ұ� (�ζ��� �並 ����Ͽ� ������������ ORDER BY �� ������� ������ ����)
SELECT ename nm, empno no
FROM emp
WHERE empno IN (7369)
--ORDER BY nm, �߰������� ���� �Ұ�, �������� ������ �ؾ��Ѵ�.
UNION
SELECT ename, empno
FROM emp
WHERE empno IN (7698)   
ORDER BY nm;   

3. SQL �� ���� �����ڴ� �ߺ��� �����Ѵ�(������ ���� ����� ����), UNION ALL �� �ߺ� ���   
   
4. �ΰ��� ���տ��� �ߺ��� �����ϱ� ���� ������ ������ �����ϴ� �۾��� �ʿ�
    ==> ����ڿ��� ����� �����ִ� �������� ������
        ==> UNION ALL �� ����� �� �ִ� ��Ȳ�� ��� UNION �� ������� �ʾƾ� 
            �ӵ����� ���鿡�� �����ϴ�

�˰�����(����- ����, ��������,......
           �ڷ� ����: Ʈ������(���� Ʈ��, �뷱�� Ʈ��)
                     heap
                     stack, queue
                     list ...
���տ����ڿ��� �߿��� ���� : �ߺ�����
�ߺ��� ���ٸ� union all ����ϴ°� ������
����ŷ ���� + �Ƴ� ����+ KFC / �Ե�
�� �ñ������� ����ŷ�� ������ ������
���� SQL ���� : WHERE, �׷쿬���� ���� GROUP BY, MULTIROW�Լ�(COUNT), 
                �ζ��κ�, ROWNUM, ORDER BY, ��Ī(�÷�, ���̺�), ROUND,
                JOIN
                
SELECT ROWNUM rn, a.sido, a.sigungu, a.city_idx
FROM 
(SELECT bk.sido, bk.sigungu, bk.cnt, kfc.cnt, mac.cnt, lot.cnt,
        ROUND ((bk.cnt + kfc.cnt + mac.cnt)/ lot.cnt, 2) city_idx
FROM
(SELECT sido, sigungu, COUNT(*)cnt
FROM FASTFOOD
WHERE gb = '����ŷ'
GROUP BY sido, sigungu) bk,

(SELECT sido, sigungu, COUNT(*)cnt
FROM FASTFOOD
WHERE gb = '�Ƶ�����'
GROUP BY sido, sigungu) mac,

(SELECT sido, sigungu, COUNT(*)cnt
FROM FASTFOOD
WHERE gb = 'KFC'
GROUP BY sido, sigungu) kfc,

(SELECT sido, sigungu, COUNT(*)cnt
FROM FASTFOOD
WHERE gb = '�Ե�����'
GROUP BY sido, sigungu) lot

WHERE bk.sido = mac.sido
  AND bk.sigungu = mac.sigungu
  AND bk.sido = kfc.sido
  AND bk.sigungu = kfc.sigungu
  AND bk.sido = lot.sido
  AND bk.sigungu = lot.sigungu
ORDER BY city_idx desc) a;




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
WHERE gb = '����ŷ'
GROUP BY sido, sigungu) bk,

(SELECT sido, sigungu, COUNT(*)cnt
FROM FASTFOOD
WHERE gb = '�Ƶ�����'
GROUP BY sido, sigungu) mac,

(SELECT sido, sigungu, COUNT(*)cnt
FROM FASTFOOD
WHERE gb = 'KFC'
GROUP BY sido, sigungu) kfc,

(SELECT sido, sigungu, COUNT(*)cnt
FROM FASTFOOD
WHERE gb = '�Ե�����'
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


����1] fastfood ���̺��� tax ���̺��� �̿��Ͽ� ������ ���� ��ȸ�ǵ��� sql�ۼ�
1. �õ� �ñ����� ���ù��������� ���ϰ� (������ ���� ���ð� ������ ����) 
2. �δ� ���� �Ű����� ���� �õ� �ñ������� ������ ���Ͽ�
3. ���ù��������� �δ� �Ű��� ������ ���� ������ ���� �����Ͽ� �Ʒ��� ���� �ø��� ��ȸ�ǵ��� sql �ۼ�
����, �ܹ��� �õ�, �ܹ��� �ñ���, �ܹ��� ���ù�������, ����û �õ�, ����û �ñ���, ����û �������� �ݾ�1�δ� �Ű���

����2] 
�ܹ��� ���ù��������� ���ϱ� ���� 4���� �ζ��� �並 ��� �Ͽ��µ� (fastfood ���̺��� 4�����)
�̸� �����Ͽ� ���̺��� �ѹ��� �д� ���·� ������ ����(fastfood ���̺��� 1���� ���)

����3] 
�ܹ������� sql�� �ٸ����·� �����ϱ�
              
              

������(ũ�Ѹ� ���� ����Ʈ)
case, decode ����ؼ�,,,
  
SELECT *
    CASE
        WHEN nm = '����ŷ' THEN 
        WHEN nm = '�Ƶ�����' THEN
        WHEN nm = 'KFC' THEN 
        WHEN nm = '�Ե�����' THEN 
FROM FASTFOOD
              
              
              
SELECT empno, ename, job, sal,comm,
    CASE
        WHEN job = 'SALESMAN' THEN sal/4
        WHEN job = 'MANAGER' THEN comm/2
        WHEN empno > 7800 THEN comm * 3
        ELSE empno
    END bon
FROM emp;


���ù�������
SELECT ROWNUM, sido, sigungu
FROM
(SELECT sido, sigungu, COUNT(*)
FROM FASTFOOD
WHERE gb = '����ŷ'
GROUP BY sido, sigungu)

UNION ALL   
SELECT ROWNUM, gb, nm, sido, sigungu
FROM
(SELECT gb, nm, sido, sigungu
FROM FASTFOOD
WHERE gb = '�Ƶ�����'
  AND sido = '����Ư����'
  AND sigungu > sido
GROUP BY gb, nm, sido, sigungu)

UNION ALL
SELECT ROWNUM, gb, nm, sido, sigungu
FROM
(SELECT gb, nm, sido, sigungu
FROM FASTFOOD
WHERE gb = 'KFC'
  AND sido = '����Ư����'
  AND sigungu > sido
GROUP BY gb, nm, sido, sigungu)

MINUS
SELECT ROWNUM, gb, nm, sido, sigungu
FROM
(SELECT gb, nm, sido, sigungu
FROM FASTFOOD
WHERE gb = '�Ե�����'
  AND sido = '����Ư����'
  AND sigungu > sido
GROUP BY gb, nm, sido, sigungu
ORDER BY nm);
              