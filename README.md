



* [Инструменты git](#инструменты-git) 

* [Работа в терминале. Лекция1](#работа-в-терминале-лекция1) 

* [Работа в терминале. Лекция2](#работа-в-терминале-лекция2)

* [Операционные системы. Лекция 1](#операционные-системы-лекция1) 
  
* [Операционные системы. Лекция 2](#операционные-системы-лекция2) 

* [Компьютерные сети. Лекция 1](#компьютерные-сети-лекция1) 

* [Компьютерные сети. Лекция 2](#компьютерные-сети-лекция2)  

* [Компьютерные сети. Лекция 3](#компьютерные-сети-лекция3) 

* [Использование Python для решения типовых DevOps-задач](#Использование-Python-для-решения-типовых-DevOps-задач) 
    
     
      
       



# Local .terraform directories
# **/.terraform/* 


Будут проигнорированны все файлы в каталоге/каталогах .terraform  
в не зависимости от расположения самого каталога .terraform  

# .tfstate files
# *.tfstate
# *.tfstate.*

Будут проигнорированны все файлы с расширением .tfstate и все файлы в имени которых присутствует .tfstate.

# Crash log files
# crash.log
# crash.*.log

Будет проигнорирован файл crash.log  и файлы crash.*.log с любыми символами вместо *

# Exclude all .tfvars files, which are likely to contain sensitive data, such as
# password, private keys, and other secrets. These should not be part of version 
# control as they are data points which are potentially sensitive and subject 
# to change depending on the environment.
# *.tfvars
# *.tfvars.json

Будут проигнорированы  файлы с расширением .tfvars и файлы содержащие в названии .tfvars.json

# Ignore override files as they are usually used to override resources locally and so
# are not checked in
# override.tf
# override.tf.json
# *_override.tf
# *_override.tf.json

Будут проигнорированны файлы override.tf и override.tf.json  
и файлы содержащие любые символы в названии до  _override.tf и _override.tf.json  
например 123_override.tf  




# Include override files you do wish to add to version control using negated pattern
# !example_override.tf
# Include tfplan files to ignore the plan output of command: terraform plan -out=tfplan
# example: *tfplan*
# Ignore CLI configuration files
# .terraformrc
# terraform.rc

Будут проигнорированны файлы .terraform и terraform.rc


# Инструменты Git


# 1 Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea.

git show aefea

Update CHANGELOG.md  
aefead2207ef7e2aa5dc81a34aedf0cad4c32545  


# 2 Какому тегу соответствует коммит 85024d3?  

git show 85024d3  
v0.12.23  

# 3 Сколько родителей у коммита b8d720? Напишите их хеши.  

git show b8d720f8^1  
56cd7859e05c36c06b56d013b55a252d0bb7e158  

git show b8d720f8^2  
9ea88f22fc6269854151c571162c5bcf958bee2b  

# 4 Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами v0.12.23 и v0.12.24  

git log --oneline v0.12.23...v0.12.24

33ff1c03bb (tag: v0.12.24) v0.12.24  
b14b74c493 [Website] vmc provider links  
3f235065b9 Update CHANGELOG.md  
6ae64e247b registry: Fix panic when server is unreachable  
5c619ca1ba website: Remove links to the getting started guide's old location  
06275647e2 Update CHANGELOG.md  
d5f9411f51 command: Fix bug when using terraform login on Windows  
4b6d06cc5d Update CHANGELOG.md  
dd01a35078 Update CHANGELOG.md  
225466bc3e Cleanup after v0.12.23 release  

# 5 Найдите коммит в котором была создана функция func providerSource, ее определение в коде выглядит так func providerSource(...)  
# (вместо троеточия перечислены аргументы).  

git log -S"func providerSource(" --oneline  
8c928e8358 main: Consult local directories as potential mirrors of providers

git show 8c928e8358  
8c928e83589d90a031f811fae52a81be7153e82f

# 6 Найдите все коммиты в которых была изменена функция globalPluginDirs.  

Ищем файл  
git grep "func globalPluginDirs("

plugins.go:func globalPluginDirs() []string {


Ищем коммиты с изменением этой функции  
git log -s -L :globalPluginDirs:plugins.go --oneline

78b1220558 Remove config.go and update things using its aliases  
52dbf94834 keep .terraform.d/plugins for discovery  
41ab0aef7a Add missing OS_ARCH dir to global plugin paths  
66ebff90cd move some more plugin search path logic to command  
8364383c35 Push plugin discovery down into command package  


# 7 Кто автор функции synchronizedWriters?

git log -S synchronizedWriters Смотрим самый ранний комит.

Martin Atkins



# Работа в терминале. Лекция1



# 1 С помощью базового файла конфигурации запустите Ubuntu 20.04 в VirtualBox посредством Vagrant:
# Создайте директорию, в которой будут храниться конфигурационные файлы Vagrant. В ней выполните vagrant init. Замените содержимое Vagrantfile по умолчанию следующим:

 Vagrant.configure("2") do |config|
 
 config.vm.box = "bento/ubuntu-20.04"
 
 end
 
# Выполнение в этой директории vagrant up установит провайдер VirtualBox для Vagrant, скачает необходимый образ и запустит виртуальную машину.
# vagrant suspend выключит виртуальную машину с сохранением ее состояния (т.е., при следующем vagrant up будут запущены все процессы внутри, которые работали на момент # вызова suspend), vagrant halt выключит виртуальную машину штатным образом.

![screenshot1](https://github.com/015fanatik/devops-netology/blob/main/screenshots/Screenshot_1.jpg)

# 2 Ознакомьтесь с графическим интерфейсом VirtualBox, посмотрите как выглядит виртуальная машина, которую создал для вас Vagrant, какие аппаратные ресурсы ей выделены. Какие ресурсы выделены по-умолчанию?

![screenshot2](https://github.com/015fanatik/devops-netology/blob/main/screenshots/Screenshot_2.jpg)
![screenshot3](https://github.com/015fanatik/devops-netology/blob/main/screenshots/Screenshot_3.jpg)
![screenshot4](https://github.com/015fanatik/devops-netology/blob/main/screenshots/Screenshot_4.jpg)

# 3 Ознакомьтесь с возможностями конфигурации VirtualBox через Vagrantfile: документация. Как добавить оперативной памяти или ресурсов процессора виртуальной машине?

Добавить в конфиг

config.vm.provider "virtualbox" do |v|

  v.memory = 1024
  
  v.cpus = 2
  
end

# 4 Команда vagrant ssh из директории, в которой содержится Vagrantfile, позволит вам оказаться внутри виртуальной машины без каких-либо дополнительных настроек. Попрактикуйтесь в выполнении обсуждаемых команд в терминале Ubuntu.

![screenshot5](https://github.com/015fanatik/devops-netology/blob/main/screenshots/Screenshot_5.jpg)

# 5 Ознакомьтесь с разделами man bash, почитайте о настройках самого bash:
# какой переменной можно задать длину журнала history, и на какой строчке manual это описывается?

![screenshot6](https://github.com/015fanatik/devops-netology/blob/main/screenshots/Screenshot_6.jpg)

# что делает директива ignoreboth в bash?

ignoreboth — использовать обе опции ‘ignorespace’ и ‘ignoredups’

ignorespace — не сохранять строки начинающиеся с символа <пробел>

ignoredups — не сохранять строки, совпадающие с последней выполненной командой

# 6 В каких сценариях использования применимы скобки {} и на какой строчке man bash это описано?

скобки {} -  применяется для создания составных комманд, указанных в man bash line 179

![screenshot8](https://github.com/015fanatik/devops-netology/blob/main/screenshots/Screenshot_8.jpg)

# 7 С учётом ответа на предыдущий вопрос, как создать однократным вызовом touch 100000 файлов? Получится ли аналогичным образом создать 300000? Если нет, то почему?

touch {1..100000}

создать 300000 файлов без изменения переменной ARG_MAX (увеличить ограничение на объём передаваемых аргументов комманде) 

![screenshot7](https://github.com/015fanatik/devops-netology/blob/main/screenshots/Screenshot_7.jpg)

# 8 В man bash поищите по /\[\[. Что делает конструкция [[ -d /tmp ]]

Конструкция [[ -d /tmp ]] вернёт 0 при наличии каталога /tmp.

# 9 Сделайте так, чтобы в выводе команды type -a bash первым стояла запись с нестандартным путем, например bash is ... Используйте знания о просмотре существующих и создании новых переменных окружения, обратите внимание на переменную окружения PATH
# bash is /tmp/new_path_directory/bash
# bash is /usr/local/bin/bash
# bash is /bin/bash

 mkdir /tmp/new_path_directory
 
 cp /bin/bash /tmp/new_path_directory/
 
 PATH=/tmp/new_path_directory/:$PATH
 
 # 10 Чем отличается планирование команд с помощью batch и at?
 
 команда at используется для назначения одноразового задания на заданное время, а команда batch — для назначения одноразовых задач, которые должны выполняться, когда загрузка системы становится меньше 1,5.
 
 # 11 Завершите работу виртуальной машины чтобы не расходовать ресурсы компьютера и/или батарею ноутбука.
 exit
 exit
 halt
 
# Работа в терминале. Лекция2

# 1 Какого типа команда cd? Попробуйте объяснить, почему она именно такого типа: опишите ход своих мыслей и поясните, если считаете, что она могла бы быть другого типа.

cd - это shell builtin команда, то есть команда, которая вызывается напрямую в shell, а не как внешняя исполняемая.

сd во всех случаях является встроенной командой, так как смена текущей директории в рамках дочернего процесса не приведет ни к каким последствиям на уровне командной
оболочки. 

Смена текущей директории в рамках дочерней командной оболочки также не влияет на текущую директорию родительской командной оболочки



type cd 

root@vagrant:~# type cd

cd is a shell builtin




# 2 Какая альтернатива без pipe для команды grep <some_string> <some_file> | wc -l?

grep -c -w

# 3 Какой процесс с PID 1 является родителем для всех процессов в вашей виртуальной машине Ubuntu 20.04?


root           1  0.0  0.6 169456 13000 ?        Ss   08:38   0:02 /sbin/init

# 4 Как будет выглядеть команда, которая перенаправит вывод stderr ls на другую сессию терминала?

 ls "не существующий каталог" 2> /dev/pts/* *-номер нужного терминала

# 5 Получится ли одновременно передать команде файл на stdin и вывести её stdout в другой файл? Приведите работающий пример.

~~~ 
root@vagrant:/home/vagrant/11# touch test 

root@vagrant:/home/vagrant/11# ls 

test

root@vagrant:/home/vagrant/11# cat <test > test2 

root@vagrant:/home/vagrant/11#

root@vagrant:/home/vagrant/11# ls

test  test2
~~~

# 6 Получится ли, находясь в графическом режиме, вывести данные из PTY в какой-либо из эмуляторов TTY? Сможете ли вы наблюдать выводимые данные?

Да 

echo "test" > /dev/pts/* *-номер нужного терминала


# 7 Выполните команду bash 5>&1. К чему она приведёт? Что будет, если вы выполните echo netology > /proc/$$/fd/5? Почему так происходит?


bash 5>&1 - создаем новый дескриптор 5 и перенаправляем его в первый ( stdout ) 

echo netology > /proc/$$/fd/5 отправляет netology в 5 дескриптор , блягодаря перенаправлению сделаному ранее netology появится в текущей консоли .


root@vagrant:~# bash 5>&1

root@vagrant:~# echo netology > /proc/$$/fd/5

netology

root@vagrant:~#

# 8 Получится ли в качестве входного потока для pipe использовать только stderr команды, не потеряв отображение stdout на pty?
Напоминаем: по умолчанию через pipe передаётся только stdout команды слева от | на stdin команды справа. Это можно сделать, поменяв стандартные потоки местами через промежуточный новый дескриптор, который вы научились создавать в предыдущем вопросе.

Можно при помощи конструкции  3>&1 1>&2 2>&3 ( 3 промежуточный дискриптор ) 



root@vagrant:/home/vagrant/11# cat test{1..5} 3>&1 1>&2 2>&3 | grep No 

123 

123 

123 

123 

123 

134 

dir123 

123 

123123 

123 

132 

234cat: test5: No such file or directory 

root@vagrant:/home/vagrant/11#

В данном случа  grep No найдёт "No" из ошибки No such file or directory.


# 9  Что выведет команда cat /proc/$$/environ? Как ещё можно получить аналогичный по содержанию вывод?


Выводится список переменных окружения для процесса, под которым выполняется текущая оболочка bash

с помощью команды env

# 10 Используя man, опишите, что доступно по адресам /proc/<PID>/cmdline, /proc/<PID>/exe.
 
 
/proc/<PID>/cmdline
 
cmdline
 
Этот файл содержит полную командную строку запуска процесса, кроме тех процессов, что полностью ушли в своппинг, а также тех, что превратились в зомби.
 
 В этих двух случаях в файле ничего нет, то есть чтение этого файла вернет 0 символов. Аргументы командной строки в этом файле указаны как список строк, каждая из 
 
 которых завешается нулевым символом, с добавочным нулевым байтом после последней строки.


/proc/<PID>/exe
 
 Под Linux 2.2 и 2.4 exe является символьной ссылкой, содержащей фактическое полное имя выполняемого файла.
 
 Символьная ссылка exe может использоваться обычным образом - при попытке открыть exe будет открыт исполняемый файл.
 
 Вы можете даже ввести /proc/[number]/exe чтобы запустить другую копию процесса такого же как и процесс с номером [число].
 
Под Linux 2.0 и в более ранних версиях exe является указателем на запущенный файл и является символьной ссылкой. Вызов readlink(2) на этот специальный файл exe под Linux 2.0 и более ранних версий возвращает строку формата:

[устройство]:индексный_дескриптор

Например, строка [0301]:1502 означает индексный дескриптор 1502 на устройстве со старшим номером устройства 03 (IDE, MFM и т. д.) и младшим номером устройства 01 (первый раздел на первом диске).

 
 # 11 Узнайте, какую наиболее старшую версию набора инструкций SSE поддерживает ваш процессор с помощью /proc/cpuinfo.
 
 root@vagrant:/home/vagrant/11# grep sse /proc/cpuinfo
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc cpuid tsc_known_freq pni pclmulqdq ssse3 cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 avx2 bmi2 invpcid rdseed clflushopt md_clear flush_l1d
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc cpuid tsc_known_freq pni pclmulqdq ssse3 cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 avx2 bmi2 invpcid rdseed clflushopt md_clear flush_l1d

Ответ: sse4_2 .
 
 # 12 При открытии нового окна терминала и vagrant ssh создаётся новая сессия и выделяется pty. Это можно подтвердить командой tty, которая упоминалась в лекции 3.2. 
 
~~~
 Однако:

 vagrant@netology1:~$ ssh localhost 'tty'
 not a tty
 Почитайте, почему так происходит и как изменить поведение.
~~~
 
 В случае выполения одиночной команды ssh на удаленном сервере не выделяется TTY
Исправить это можно опцией -t, принудительное выделение псевдотерминала: ssh -t localhost 'tty'
 
 
 # 13 Бывает, что есть необходимость переместить запущенный процесс из одной сессии в другую. Попробуйте сделать это, воспользовавшись reptyr.
 Например, так можно перенести в screen процесс, который вы запустили по ошибке в обычной SSH-сессии.
 
 
 
Записать 0 в  /proc/sys/kernel/yama/ptrace_scope
 
 Start a long running process, e.g. top
 
Background the process with CTRL-Z

Resume the process in the background: bg

Display your running background jobs with jobs -l, this should look like this:

[1]+  4711 Stopped (signal)        top

(The -l in jobs -l makes sure you'll get the PID)

Disown the jobs from the current parent with disown top. After that, jobs will not show the job any more, but ps -a will.

Start your terminal multiplexer of choice, e.g. tmux

Reattach to the backgrounded process: reptyr 4711

Detach your terminal multiplexer (e.g. CTRL-A D) and close ssh

Reconnect ssh, attach to your multiplexer (e.g. tmux attach), rejoice!

 
 
 
 
 
 
 # 14 sudo echo string > /root/new_file не даст выполнить перенаправление под обычным пользователем, так как перенаправлением занимается процесс shell, который запущен без sudo под вашим пользователем. Для решения этой проблемы можно использовать конструкцию echo string | sudo tee /root/new_file. Узнайте, что делает команда tee и почему в отличие от sudo echo команда с sudo tee будет работать.
 
 
tee - читает из стандартного ввода и записывает как в стандартный вывод, в один или несколько файлов одновременно.
Так как shell работает в том переменном окружении пользователя в котором он запущен то перенаправить вывод в файл принадлежащий другому пользователю нельзя было.
Во втором случае команда tee запущена от root, поэтому были права на запись.



# Операционные системы. Лекция1

~~~  
# 1 Какой системный вызов делает команда cd?

В прошлом ДЗ вы выяснили, что cd не является самостоятельной программой. Это shell builtin, поэтому запустить strace непосредственно на cd не получится. Вы можете запустить strace на /bin/bash -c 'cd /tmp'. В этом случае увидите полный список системных вызовов, которые делает сам bash при старте.

Вам нужно найти тот единственный, который относится именно к cd. Обратите внимание, что strace выдаёт результат своей работы в поток stderr, а не в stdout.

~~~


  
 chdir ("/tmp")

![screenshot9](https://github.com/015fanatik/devops-netology/blob/main/screenshots/Screenshot_9.jpg)
  
  
# 2 Попробуйте использовать команду file на объекты разных типов в файловой системе. Например:
  
~~~
vagrant@netology1:~$ file /dev/tty
/dev/tty: character special (5/0)
vagrant@netology1:~$ file /dev/sda
/dev/sda: block special (8/0)
vagrant@netology1:~$ file /bin/bash
/bin/bash: ELF 64-bit LSB shared object, x86-64
~~~  
  
# Используя strace, выясните, где находится база данных file, на основании которой она делает свои догадки.
  
  /usr/share/misc/magic.mgc
  
  /usr/share/misc/magic.mgc - файл определения типов для команды file. File позволяет определить тип файла посредством проверки соответствия начальных символов файла определенному "магическому" числу.
  
  
  
  
  
  
  

  
  # 3 Предположим, приложение пишет лог в текстовый файл. Этот файл оказался удалён (deleted в lsof), но сказать сигналом приложению переоткрыть файлы или просто перезапустить приложение возможности нет. Так как приложение продолжает писать в удалённый файл, место на диске постепенно заканчивается. Основываясь на знаниях о перенаправлении потоков, предложите способ обнуления открытого удалённого файла, чтобы освободить место на файловой системе.
  
  Найти файловый дескриптор нужного процесса и отправить в него "ничего"
  
  ![screenshot10](https://github.com/015fanatik/devops-netology/blob/main/screenshots/Screenshot_10.jpg) 
  
  ![screenshot11](https://github.com/015fanatik/devops-netology/blob/main/screenshots/Screenshot_11.jpg) 
  
  ![screenshot12](https://github.com/015fanatik/devops-netology/blob/main/screenshots/Screenshot_12.jpg) 
  
  
  
  
    > "/proc/640/fd/9"
  
 
  
  
  # 4 Занимают ли зомби-процессы ресурсы в ОС (CPU, RAM, IO)?
  
  Проце́сс-зо́мби, зо́мби (англ. zombie process, англ. defunct process) — дочерний процесс в Unix-системе, завершивший своё выполнение, но ещё присутствующий в списке процессов операционной системы, чтобы дать родительскому процессу считать код завершения.
  Зомби не занимают памяти (как процессы-сироты), но блокируют записи в таблице процессов, размер которой ограничен для каждого пользователя и системы в целом.

  
 # 5 В IO Visor BCC есть утилита opensnoop:
  
  
~~~
root@vagrant:~# dpkg -L bpfcc-tools | grep sbin/opensnoop
/usr/sbin/opensnoop-bpfcc
~~~

# На какие файлы вы увидели вызовы группы open за первую секунду работы утилиты? Воспользуйтесь пакетом bpfcc-tools для Ubuntu 20.04. Дополнительные сведения по установке по ссылке.

![screenshot13](https://github.com/015fanatik/devops-netology/blob/main/screenshots/Screenshot_13.jpg) 
  
  
# 6 Какой системный вызов использует uname -a? Приведите цитату из man по этому системному вызову, где описывается альтернативное местоположение в /proc и где можно узнать версию ядра и релиз ОС.
  
uname 
  
Part of the utsname information is also accessible via /proc/sys/kernel/{ostype, hostname, osrelease, version, domainname}.  

![screenshot14](https://github.com/015fanatik/devops-netology/blob/main/screenshots/Screenshot_14.jpg)
  
  
  # 7 Чем отличается последовательность команд через ; и через && в bash? Например:
  
  ~~~
  root@netology1:~# test -d /tmp/some_dir; echo Hi
Hi
root@netology1:~# test -d /tmp/some_dir && echo Hi
root@netology1:~#
  ~~~~
  Есть ли смысл использовать в bash &&, если применить set -e?
  
  
Команда отделённая посредством символов && в отличие от ; будет выполнена только в случае успешного выполнения предыдущей команды.
Использовать && совместно с set -e не имеет смысла, т.к. set -e завершит сессию в случае безуспешного выполнения команды.

# 8  Из каких опций состоит режим bash set -euxo pipefail, и почему его хорошо было бы использовать в сценариях?
  
 -e завершает сессию, если выполненная команда дала ненулевой статус выхода; 
  
-u обрабатывает неустановленные или неопределенные переменные, за исключением специальных параметров, таких как подстановочные знаки (*) или «@», как ошибки во время раскрытия параметра; 
  
-x выводит команды и аргументы во время выполнения; 
  
-o pipefail при включении данной опции статус выхода из конвейера является значением последней (самой правой) команды, завершённой с ненулевым статусом, или ноль — если работа всех команд завершена успешно. 
  
Данный режим обнаружить ошибки при выполнении сценария.
  
 # 9 Используя -o stat для ps, определите, какой наиболее часто встречающийся статус у процессов в системе. В man ps изучите (/PROCESS STATE CODES), что значат дополнительные к основной заглавной букве статуса процессов. Его можно не учитывать при расчёте (считать S, Ss или Ssl равнозначными).
  
  
  ![screenshot15](https://github.com/015fanatik/devops-netology/blob/main/screenshots/Screenshot_15.png)
  
  ![screenshot16](https://github.com/015fanatik/devops-netology/blob/main/screenshots/Screenshot_16.png)
  
  
  
  
  
  # Операционные системы лекция2 
  
# 1 На лекции вы познакомились с node_exporter. 
 
 В демонстрации его исполняемый файл запускался в background. 
  
 Этого достаточно для демо, но не для настоящей production-системы, где процессы должны находиться под внешним управлением. 
  
 Используя знания из лекции по systemd, создайте самостоятельно простой unit-файл для node_exporter: 
  
 поместите его в автозагрузку; 
  
 предусмотрите возможность добавления опций к запускаемому процессу через внешний файл (посмотрите, например, на systemctl cat cron); 
  
 удостоверьтесь, что с помощью systemctl процесс корректно стартует, завершается, а после перезагрузки автоматически поднимается. 
  



  ![unit.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/unit.png) 
   
  ![sysremctl.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/sysremctl.png) 
   
  ![status.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/status.png)
  
  
  # 2  Изучите опции node_exporter и вывод /metrics по умолчанию. Приведите несколько опций, которые вы бы выбрали для базового мониторинга хоста по CPU, памяти, диску и сети. 
   
   ![metrics.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/metrics.png)
   
   ![node_exporter.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/node_exporter.png) 
  
  
  # 3 Установите в свою виртуальную машину Netdata. Воспользуйтесь готовыми пакетами для установки (sudo apt install -y netdata).
  # После успешной установки:

в конфигурационном файле /etc/netdata/netdata.conf в секции [web] замените значение с localhost на bind to = 0.0.0.0;
добавьте в Vagrantfile проброс порта Netdata на свой локальный компьютер и сделайте vagrant reload:
config.vm.network "forwarded_port", guest: 19999, host: 19999
После успешной перезагрузки в браузере на своём ПК (не в виртуальной машине) вы должны суметь зайти на localhost:19999. Ознакомьтесь с метриками, которые по умолчанию собираются Netdata, и с комментариями, которые даны к этим метрикам.
  
  ![netdata.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/netdata.png)
  
  
  
  # 4 Можно ли по выводу dmesg понять, осознаёт ли ОС, что загружена не на настоящем оборудовании, а на системе виртуализации? 
  
  Да можно.
  
  
  ![vbox.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/vbox.png)
  
  # 5 Как настроен sysctl fs.nr_open на системе по умолчанию? Определите, что означает этот параметр. Какой другой существующий лимит не позволит достичь такого числа (ulimit --help)?  
  
   
  ![ulimit.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/ulimit.png)
  
  
  ulimit -a и ulimit -aH покажет текущие "мягкие" и (второй вызов) "жесткие" ограничения. При помощи ulimit можно открутить мягкие ограничения до пределов жестких. Следует понимать, что ulimit меняет только текущие лимиты, для шелла и всех программ, запущенных в этом шелле, поэтому после завершения сессии или даже в другом окне терминала значения останутся прежними.
Следующее место задания ограничений, на этот раз постоянных — это /etc/security/limits.conf и каталог /etc/security/limits.d/, ограничение называется nofile. Редактировать (а, иногда, и смотреть) эти файлы может только суперпользователь ("root"). Там задаются ограничения на отдельных пользователей или группы, применяемые на всю сессию данного пользователя, или всех пользователей определенной группы.
И наконец, есть "системное ограничение", задаваемое через sysctl - это fs.nr_open:

/sbin/sysctl -n fs.nr_open
ему же соответствует файл /proc/sys/fs/nr_open

  
  # 6 апустите любой долгоживущий процесс (не ls, который отработает мгновенно, а, например, sleep 1h) в отдельном неймспейсе процессов; покажите, что ваш процесс работает под PID 1 через nsenter. Для простоты работайте в этом задании под root (sudo -i). Под обычным пользователем требуются дополнительные опции (--map-root-user) и т. д.
  
  ![unshare.jpg](https://github.com/015fanatik/devops-netology/blob/main/screenshots/unshare.jpg) 
  
   ![nsenter.jpg](https://github.com/015fanatik/devops-netology/blob/main/screenshots/nsenter.jpg)
  
  
  # 7 Найдите информацию о том, что такое :(){ :|:& };:. Запустите эту команду в своей виртуальной машине Vagrant с Ubuntu 20.04 (это важно, поведение в других ОС не проверялось). Некоторое время всё будет плохо, после чего (спустя минуты) — ОС должна стабилизироваться. Вызов dmesg расскажет, какой механизм помог автоматической стабилизации. Как настроен этот механизм по умолчанию, и как изменить число процессов, которое можно создать в сессии?

  
  ![fork_bomb1.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/fork_bomb1.png) 
  
   
  ![sb.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/sb.png) 
   
  ![fork_bomb2.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/fork_bomb2.png)
   
  ![ssh.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/ssh.png)
  
  https://interface31.ru/tech_it/2022/09/linux---nachinayushhim-chto-takoe-oom-killer-i-kak-on-rabotaet.html 
  
  
  
  
  # Компьютерные сети. Лекция1
  
  Шаг 1. Работа c HTTP через telnet.

Подключитесь утилитой telnet к сайту stackoverflow.com: 

telnet stackoverflow.com 80

Отправьте HTTP-запрос: 

GET /questions HTTP/1.0 

HOST: stackoverflow.com 

[press enter] 

[press enter] 

В ответе укажите полученный HTTP-код и поясните, что он означает. 

   
 ![403.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/403.png)   
 
 HTTP 403 Forbidden — стандартный код ответа HTTP, означающий, что доступ к запрошенному ресурсу запрещен. Сервер понял запрос, но не выполнит его.
   
  

Шаг 2. Повторите задание 1 в браузере, используя консоль разработчика F12:

откройте вкладку Network;
отправьте запрос http://stackoverflow.com;
найдите первый ответ HTTP-сервера, откройте вкладку Headers;
укажите в ответе полученный HTTP-код;
проверьте время загрузки страницы и определите, какой запрос обрабатывался дольше всего;
приложите скриншот консоли браузера в ответ.  


  ![f12.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/f12.png) 
  
   
    
    
  ![f12_2.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/f12_2.png)
   
   
  
Шаг 3. Какой IP-адрес у вас в интернете?  
  
  ![ip.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/ip.png)
  

Шаг 4. Какому провайдеру принадлежит ваш IP-адрес? Какой автономной системе AS? Воспользуйтесь утилитой whois.
  

route:          5.165.136.0/22 
  
origin:         AS49048 
  
org:            ORG-CHTB4-RIPE 
  
descr:          CJSC "ER-Telecom Holding" Tver' branch 
  
descr:          Tver', Russia 
  
mnt-by:         RAID-MNT 
  
created:        2012-08-05T11:24:37Z 
  
last-modified:  2012-08-05T11:24:37Z 
  
source:         RIPE 
  


Шаг 5. Через какие сети проходит пакет, отправленный с вашего компьютера на адрес 8.8.8.8? Через какие AS? Воспользуйтесь утилитой traceroute.
  
![traceroute.png](https://github.com/015fanatik/devops-netology/blob/main/traceroute.png)
  

Шаг 6. Повторите задание 5 в утилите mtr. На каком участке наибольшая задержка — delay?
  
  ![mtr.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/mtr.png)
  

Шаг 7. Какие DNS-сервера отвечают за доменное имя dns.google? Какие A-записи? Воспользуйтесь утилитой dig.
  
  ![dig.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/dig.png)

Шаг 8. Проверьте PTR записи для IP-адресов из задания 7. Какое доменное имя привязано к IP? Воспользуйтесь утилитой dig. 
    
  
  ![dig2.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/dig2.png) 
  
  # Компьютерные сети. Лекция2 
  
  
 Задание 
  
1 Проверьте список доступных сетевых интерфейсов на вашем компьютере. Какие команды есть для этого в Linux и в Windows?
  
  ip -a 
   
  ifconfig 
   
  cat /proc/net/dev
  
  Для windows 
  
  ipconfig /all
  
  

2 Какой протокол используется для распознавания соседа по сетевому интерфейсу? Какой пакет и команды есть в Linux для этого? 
   
  Link Layer Discovery Protocol (LLDP) — протокол канального уровня, который позволяет сетевым устройствам анонсировать в сеть информацию о себе и о своих возможностях, а также собирать эту информацию о соседних устройствах.
  

3 Какая технология используется для разделения L2-коммутатора на несколько виртуальных сетей? Какой пакет и команды есть в Linux для этого? Приведите пример конфига. 
   
  
  VLAN (аббр. от англ. Virtual Local Area Network) — виртуальная локальная компьютерная сеть. Представляет собой группу хостов с общим набором требований[источник не указан 719 дней], которые взаимодействуют так, как если бы они были подключены к широковещательному домену независимо от их физического местонахождения. VLAN имеет те же свойства, что и физическая локальная сеть, но позволяет конечным членам группироваться вместе, даже если они не находятся в одной физической сети. Такая реорганизация может быть сделана на основе программного обеспечения вместо физического перемещения устройств. 
   
  apt install vlan 
~~~  
  auto vlan1400
iface vlan1400 inet static
address 192.168.1.1
netmask 255.255.255.0
vlan_raw_device eth0 
  
   
  
auto eth0.1400
iface eth0.1400 inet static
address 192.168.1.1
netmask 255.255.255.0
vlan_raw_device eth0
~~~
4 Какие типы агрегации интерфейсов есть в Linux? Какие опции есть для балансировки нагрузки? Приведите пример конфига. 
   
  mode=0 (balance-rr)
Этот режим используется по-умолчанию, если в настройках не указано другое. balance-rr обеспечивает балансировку нагрузки и отказоустойчивость. В данном режиме пакеты отправляются "по кругу" от первого интерфейса к последнему и сначала. Если выходит из строя один из интерфейсов, пакеты отправляются на остальные оставшиеся.При подключении портов к разным коммутаторам, требует их настройки.

mode=1 (active-backup)
При active-backup один интерфейс работает в активном режиме, остальные в ожидающем. Если активный падает, управление передается одному из ожидающих. Не требует поддержки данной функциональности от коммутатора.

mode=2 (balance-xor)
Передача пакетов распределяется между объединенными интерфейсами по формуле ((MAC-адрес источника) XOR (MAC-адрес получателя)) % число интерфейсов. Один и тот же интерфейс работает с определённым получателем. Режим даёт балансировку нагрузки и отказоустойчивость.

mode=3 (broadcast)
Происходит передача во все объединенные интерфейсы, обеспечивая отказоустойчивость.

mode=4 (802.3ad)
Это динамическое объединение портов. В данном режиме можно получить значительное увеличение пропускной способности как входящего так и исходящего трафика, используя все объединенные интерфейсы. Требует поддержки режима от коммутатора, а так же (иногда) дополнительную настройку коммутатора.

mode=5 (balance-tlb)
Адаптивная балансировка нагрузки. При balance-tlb входящий трафик получается только активным интерфейсом, исходящий - распределяется в зависимости от текущей загрузки каждого интерфейса. Обеспечивается отказоустойчивость и распределение нагрузки исходящего трафика. Не требует специальной поддержки коммутатора.

mode=6 (balance-alb)
Адаптивная балансировка нагрузки (более совершенная). Обеспечивает балансировку нагрузки как исходящего (TLB, transmit load balancing), так и входящего трафика (для IPv4 через ARP). Не требует специальной поддержки коммутатором, но требует возможности изменять MAC-адрес устройства. 
~~~   
  network:
  version: 2
  renderer: networkd
  ethernets:
    enp3s0f0:
      dhcp4: no
    ensp3s0f1:
      dhcp4: no
  bonds:
    bond0:
      dhcp4: no
      interfaces: [enp3s0f0, enp3s0f1]
      parameters: 
        mode: 802.3ad
        mii-monitor-interval: 1

  vlans:
    vlan10:
      id: 10
      link: bond0
      dhcp4: no
      addresses: [10.10.10.2/24]
      routes:
        - to: 10.10.10.2/24
          via: 10.10.10.1
          on-link: true

    vlan20:
      id: 20
      link: bond0
      dhcp4: no
      addresses: [10.10.11.2/24]
      gateway: 10.10.11.1
      nameserver:
      addresses: [8.8.8.8]
~~~
5 Сколько IP-адресов в сети с маской /29 ?  
  
 В сети с маской /29 8 адресов из них 2 зарезервированный под адрес сети и броадкаст адрес . 
  Соответственно продуктивных хостов 6  из них один шлюз если сеть маршрутизируемая.  
  
 Сколько /29 подсетей можно получить из сети с маской /24.
 256/8 = 32 сети  
   
  Приведите несколько примеров /29 подсетей внутри сети 10.10.10.0/24.
  Network: 10.10.10.0/29 Network: 10.10.10.8/29 Network: 10.10.10.16/29
  

6 Задача: вас попросили организовать стык между двумя организациями. Диапазоны 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16 уже заняты. Из какой подсети допустимо взять частные IP-адреса? Маску выберите из расчёта — максимум 40–50 хостов внутри подсети.
  
  Частные диапазоны IP-адресов
Следующие диапазоны определены IANA как адреса, выделенные локальным сетям:

10.0.0.0 — 10.255.255.255 (маска подсети для бесклассовой (CIDR) адресации: 255.0.0.0 или /8)
100.64.0.0 — 100.127.255.255 (маска подсети 255.192.0.0 или /10) - Данная подсеть рекомендована согласно RFC 6598 для использования в качестве адресов для CGN (Carrier-Grade NAT).
172.16.0.0 — 172.31.255.255 (маска подсети: 255.240.0.0 или /12)
192.168.0.0 — 192.168.255.255 (маска подсети: 255.255.0.0 или /16) 
  
~~~ 
  us@ubuntu:~$ ipcalc 100.64.0.0/10 -s 50
Address:   100.64.0.0           01100100.01 000000.00000000.00000000
Netmask:   255.192.0.0 = 10     11111111.11 000000.00000000.00000000
Wildcard:  0.63.255.255         00000000.00 111111.11111111.11111111
=>
Network:   100.64.0.0/10        01100100.01 000000.00000000.00000000
HostMin:   100.64.0.1           01100100.01 000000.00000000.00000001
HostMax:   100.127.255.254      01100100.01 111111.11111111.11111110
Broadcast: 100.127.255.255      01100100.01 111111.11111111.11111111
Hosts/Net: 4194302               Class A

1. Requested size: 50 hosts
Netmask:   255.255.255.192 = 26 11111111.11111111.11111111.11 000000
Network:   100.64.0.0/26        01100100.01000000.00000000.00 000000
HostMin:   100.64.0.1           01100100.01000000.00000000.00 000001
HostMax:   100.64.0.62          01100100.01000000.00000000.00 111110
Broadcast: 100.64.0.63          01100100.01000000.00000000.00 111111
Hosts/Net: 62                    Class A

Needed size:  64 addresses.
Used network: 100.64.0.0/26
Unused:
100.64.0.64/26
100.64.0.128/25
100.64.1.0/24
100.64.2.0/23
100.64.4.0/22
100.64.8.0/21
100.64.16.0/20
100.64.32.0/19
100.64.64.0/18
100.64.128.0/17
100.65.0.0/16
100.66.0.0/15
100.68.0.0/14
100.72.0.0/13
100.80.0.0/12
100.96.0.0/11
~~~
7 Как проверить ARP-таблицу в Linux, Windows? Как очистить ARP-кеш полностью? Как из ARP-таблицы удалить только один нужный IP?
  
  Windows : 
  
  Проверить  arp -a  
  
  Удалить полностью netsh interface IP delete arpcache 
  
  Удалить конкретный адрес arp -d 192.168.5.254
  
  
  
  
  Linux :  
  
  apt install net-tool 
  
  Проверить  arp 
  
   Удалить конкретный адрес arp -d 192.168.5.254
  
  Удалить полностью ip neigh flush all  
  
  
  # Компьютерные сети. Лекция3  
  
  
 1  Подключитесь к публичному маршрутизатору в интернет. Найдите маршрут к вашему публичному IP.  
  
  
  
telnet route-views.routeviews.org  

Username: rviews  

show ip route x.x.x.x/32  

show bgp x.x.x.x/32  

~~~
route-views>show ip route *.*.*.*
Routing entry for *.*.*.*/22, supernet
  Known via "bgp 6447", distance 20, metric 0
  Tag 3303, type external
  Last update from 217.192.89.50 2d04h ago
  Routing Descriptor Blocks:
  * 217.192.89.50, from 217.192.89.50, 2d04h ago
      Route metric is 0, traffic share count is 1
      AS Hops 2
      Route tag 3303
      MPLS label: none
route-views>show bgp *.*.*.*
BGP routing table entry for *.*.*.*/22, version 2784144856
Paths: (21 available, best #21, table default)
  Not advertised to any peer
  Refresh Epoch 1
  3267 35598 49120
  ~~~
  
  
  2 Создайте dummy-интерфейс в Ubuntu. Добавьте несколько статических маршрутов. Проверьте таблицу маршрутизации.
  
  
  ~~~
  Создаем 2 файла .dev и network для dummy, после systemctl restart systemd-networkd проверяем
ubuntu@git:/etc/systemd/network$ ls
dum.netdev  dum.network
ubuntu@git:/etc/systemd/network$ more dum.netdev
[NetDev]
Name=dum
Kind=dummy
ubuntu@git:/etc/systemd/network$ nmcli
dum: connected (externally) to dum
        "dum"
        dummy, C2:50:AE:7F:E5:9D, sw, mtu 1500
        inet4 172.16.1.25/16
        route4 172.16.0.0/16 metric 0
        inet6 fe80::c050:aeff:fe7f:e59d/64
        route6 fe80::/64 metric 256


ubuntu@git:/etc/systemd/network$ ifconfig -s
Iface      MTU    RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
dum       1500        0      0      0 0            35      0      0      0 BORU
enp0s3    1500   237863      0      0 0         55294      0      0      0 BMRU
lo       65536     7572      0      0 0          7572      0      0      0 LRU

Network Manager пример создания маршрута указываю через nmcli
root@git:/etc/NetworkManager/system-connections# sudo nmcli connection modify Wired\ connection\ 1 +ipv4.routes "10.20.30.0/24 *.*.*.*"
root@git:/etc/NetworkManager/system-connections# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         router          0.0.0.0         UG    100    0        0 enp0s3
10.20.30.0      router          255.255.255.0   UG    100    0        0 enp0s3
link-local      0.0.0.0         255.255.0.0     U     1000   0        0 enp0s3
172.16.0.0      0.0.0.0         255.255.0.0     U     0      0        0 dum
*.*.*.*         0.0.0.0         255.255.255.0   U     100    0        0 enp0s3
router          0.0.0.0         255.255.255.255 UH    100    0        0 enp0s3
root@git:/etc/NetworkManager/system-connections#
  ~~~
  
 3 Проверьте открытые TCP-порты в Ubuntu. Какие протоколы и приложения используют эти порты? Приведите несколько примеров.  
  
  ~~~
  ss -tn

State    Recv-Q    Send-Q       Local Address:Port        Peer Address:Port     Process
ESTAB    0         0            *.*.*.*:22        *.*.*.*:55036

ESTAB    0         0            *.*.*.*:ssh        *.*.*.*:55036
  ~~~
  
  4 Проверьте используемые UDP-сокеты в Ubuntu. Какие протоколы и приложения используют эти порты?  
    
  ~~~
  ss -un
Recv-Q    Send-Q              Local Address:Port         Peer Address:Port      Process
0         0            *.*.*.*%enp0s3:68       *.*.*.*:67

0         0            *.*.*.*%enp0s3:bootpc       *.*.*.*:bootps
  ~~~
  
5 Используя diagrams.net, создайте L3-диаграмму вашей домашней сети или любой другой сети, с которой вы работали.  


![net.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/net.png)





# Использование Python для решения типовых DevOps-задач

### Цель задания

В результате выполнения задания вы:

* познакомитесь с синтаксисом Python;
* узнаете, для каких типов задач его можно использовать;
* воспользуетесь несколькими модулями для работы с ОС.


### Инструкция к заданию

1. Установите Python 3 любой версии.
2. Скопируйте в свой .md-файл содержимое этого файла, исходники можно посмотреть [здесь](https://raw.githubusercontent.com/netology-code/sysadm-homeworks/devsys10/04-script-02-py/README.md).
3. Заполните недостающие части документа решением задач — заменяйте `???`, остальное в шаблоне не меняйте, чтобы не сломать форматирование текста, подсветку синтаксиса. Вместо логов можно вставить скриншоты по желанию.
4. Для проверки домашнего задания в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем репозитории.
4. Любые вопросы по выполнению заданий задавайте в чате учебной группы или в разделе «Вопросы по заданию» в личном кабинете.

### Дополнительные материалы

1. [Полезные ссылки для модуля «Скриптовые языки и языки разметки».](https://github.com/netology-code/sysadm-homeworks/tree/devsys10/04-script-03-yaml/additional-info)

------

## Задание 1

Есть скрипт:

```
  python
#!/usr/bin/env python3
a = 1
b = '2'
c = a + b
  
```

### Вопросы:

| Вопрос  | Ответ |
| ------------- | ------------- |
| Какое значение будет присвоено переменной `c`?  | integer |
| Как получить для переменной `c` значение 12?  | c = str(a) + b  |
| Как получить для переменной `c` значение 3?  | c = a + int (b)
------

## Задание 2

Мы устроились на работу в компанию, где раньше уже был DevOps-инженер. Он написал скрипт, позволяющий узнать, какие файлы модифицированы в репозитории относительно локальных изменений. Этим скриптом недовольно начальство, потому что в его выводе есть не все изменённые файлы, а также непонятен полный путь к директории, где они находятся. 

Как можно доработать скрипт ниже, чтобы он исполнял требования вашего руководителя?

```python
#!/usr/bin/env python3

import os

bash_command = ["cd ~/netology/sysadm-homeworks", "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
is_change = False
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(prepare_result)
        break
```

### Ваш скрипт:

![script1.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/script1.png)

### Вывод скрипта при запуске во время тестирования:

![script1.1.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/script1.1.png)

------

## Задание 3

Доработать скрипт выше так, чтобы он не только мог проверять локальный репозиторий в текущей директории, но и умел воспринимать путь к репозиторию, который мы передаём, как входной параметр. Мы точно знаем, что начальство будет проверять работу этого скрипта в директориях, которые не являются локальными репозиториями.

### Ваш скрипт:


![script2.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/script2.png)


### Вывод скрипта при запуске во время тестирования:

![script2.2.png](https://github.com/015fanatik/devops-netology/blob/main/screenshots/script2.2.png)

------

## Задание 4

Наша команда разрабатывает несколько веб-сервисов, доступных по HTTPS. Мы точно знаем, что на их стенде нет никакой балансировки, кластеризации, за DNS прячется конкретный IP сервера, где установлен сервис. 

Проблема в том, что отдел, занимающийся нашей инфраструктурой, очень часто меняет нам сервера, поэтому IP меняются примерно раз в неделю, при этом сервисы сохраняют за собой DNS-имена. Это бы совсем никого не беспокоило, если бы несколько раз сервера не уезжали в такой сегмент сети нашей компании, который недоступен для разработчиков. 

Мы хотим написать скрипт, который: 

- опрашивает веб-сервисы; 
- получает их IP; 
- выводит информацию в стандартный вывод в виде: <URL сервиса> - <его IP>. 

Также должна быть реализована возможность проверки текущего IP сервиса c его IP из предыдущей проверки. Если проверка будет провалена — оповестить об этом в стандартный вывод сообщением: [ERROR] <URL сервиса> IP mismatch: <старый IP> <Новый IP>. Будем считать, что наша разработка реализовала сервисы: `drive.google.com`, `mail.google.com`, `google.com`.

### Ваш скрипт:

```python
???
```

### Вывод скрипта при запуске во время тестирования:

```
???
```

------

