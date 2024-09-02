# Vacancies
puts "Seeding Vacancies..."

Vacancy.delete_all

location = "Мурманск, улица Полярные Зори, 44"
published_at = DateTime.new(2024, 06, 01, 16, 00, 00)

description_agent = <<-HTML
<p>Агентство недвижимости РиелтСтройСфера приглашает Вас на увлекательное и перспективное собеседование!</p>
<p>У нас предоставляются щедрые выплаты стипендии, что позволит вам сосредоточиться на своем профессиональном росте без финансовых ограничений.</p>
<p>Мы также гордимся тем, что предлагаем бесплатное и индивидуальное обучение, которое поможет вам развить все необходимые навыки для успешной карьеры в сфере недвижимости.</p>
<p>Наш коллектив отличается прекрасной и дружелюбной атмосферой, в которой вы будете себя комфортно чувствовать и получать поддержку от коллег.</p>
<p>Как агент по недвижимости в нашем агентстве, вы будете заниматься широким спектром задач, связанных с поиском, предложением и продажей недвижимости. Ваша главная цель - помочь клиентам найти идеальную недвижимость, которая соответствует их потребностям и желаниям.</p>
<h5>Ваши обязанности будут включать, но не ограничиваться:</h5>
<ul class="list-none">
<li class="items-center mb-2"><i class="bi bi-arrow-right-short"></i>активный поиск клиентов и эффективная работа с имеющейся базой данных;</li>
<li class="items-center mb-2"><i class="bi bi-arrow-right-short"></i>профессиональная консультация и помощь клиентам в выборе недвижимости;</li>
<li class="items-center mb-2"><i class="bi bi-arrow-right-short"></i>организация и проведение просмотров объектов недвижимости;</li>
<li class="items-center mb-2"><i class="bi bi-arrow-right-short"></i>ведение переговоров и совершение сделок с покупателями и продавцами;</li>
<li class="items-center mb-2"><i class="bi bi-arrow-right-short"></i>управление документацией и соблюдение законодательства в области недвижимости;</li>
</ul>
HTML
more_info_agent = <<-HTML
<p>Мы ждем вас на нашем собеседовании для обсуждения возможности воплотить ваши мечты о карьере в сфере недвижимости!</p>
HTML

description_agent2 = <<-HTML
<p>Агентство недвижимости РиелтСтройСфера приглашает Вас на увлекательное и перспективное собеседование!</p>
<p>У нас предоставляются щедрые выплаты стипендии, что позволит вам сосредоточиться на своем профессиональном росте без финансовых ограничений.</p>
<p>Мы также гордимся тем, что предлагаем бесплатное и индивидуальное обучение, которое поможет вам развить все необходимые навыки для успешной карьеры в сфере недвижимости.</p>
<p>Наш коллектив отличается прекрасной и дружелюбной атмосферой, в которой вы будете себя комфортно чувствовать и получать поддержку от коллег.</p>
<p>Как агент по недвижимости в нашем агентстве, вы будете заниматься широким спектром задач, связанных с поиском, предложением и продажей недвижимости. Ваша главная цель - помочь клиентам найти идеальную недвижимость, которая соответствует их потребностям и желаниям.</p>

<h5>Ваши обязанности будут включать, но не ограничиваться:</h5>
<ul class="list-none">
<li class="items-center mb-2"><i class="bi bi-arrow-right-short"></i>активный поиск клиентов и эффективная работа с имеющейся базой данных;</li>
<li class="items-center mb-2"><i class="bi bi-arrow-right-short"></i>профессиональная консультация и помощь клиентам в выборе недвижимости;</li>
<li class="items-center mb-2"><i class="bi bi-arrow-right-short"></i>организация и проведение просмотров объектов недвижимости;</li>
<li class="items-center mb-2"><i class="bi bi-arrow-right-short"></i>ведение переговоров и совершение сделок с покупателями и продавцами;</li>
<li class="items-center mb-2"><i class="bi bi-arrow-right-short"></i>управление документацией и соблюдение законодательства в области недвижимости;</li>
</ul>
HTML
more_info_agent2 = <<-HTML
<p>Мы ждем вас на нашем собеседовании для обсуждения возможности воплотить ваши мечты о карьере в сфере недвижимости!</p>
HTML

description_agent3 = <<-HTML
<p>Агентство недвижимости РиелтСтройСфера приглашает Вас на собеседование!</p>
<p>У нас предоставляются щедрые выплаты стипендии, что позволит вам сосредоточиться на своем профессиональном росте без финансовых ограничений.</p>
<p>Мы также гордимся тем, что предлагаем бесплатное и индивидуальное обучение, которое поможет вам развить все необходимые навыки для успешной карьеры в сфере недвижимости.</p>
<p>Наш коллектив отличается прекрасной и дружелюбной атмосферой, в которой вы будете себя комфортно чувствовать и получать поддержку от коллег.</p>
<p>Как агент по недвижимости в нашем агентстве, вы будете заниматься широким спектром задач, связанных с поиском, предложением и продажей недвижимости. Ваша главная цель - помочь клиентам найти идеальную недвижимость, которая соответствует их потребностям и желаниям.</p>
<h5>Ваши обязанности будут включать, но не ограничиваться:</h5>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
активный поиск клиентов и эффективная работа с имеющейся базой данных;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
профессиональная консультация и помощь клиентам в выборе недвижимости;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
организация и проведение просмотров объектов недвижимости;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
ведение переговоров и совершение сделок с покупателями и продавцами;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
управление документацией и соблюдение законодательства в области недвижимости;
</li>
</ul>
HTML
more_info_agent3 = <<-HTML
<p>Мы ждем вас на нашем собеседовании для обсуждения возможности воплотить ваши мечты о карьере в сфере недвижимости!</p>
HTML

description_manager1 = <<-HTML
<p>Привет! На связи агентство недвижимости РиелтСтройСфера. Мы представляем свои услуги не только по Мурманску и области, но также по всей России. Наша команда специалистов обладает многолетним опытом работы в сфере недвижимости, они помогут тебе развиться и обучиться, получить колоссальный опыт в этой сфере. И сейчас в связи с расширением мы открываем вакансию Агента по недвижимости.</p>
<h5>Почему работать у нас — это круто:</h5>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
у наших услуг нет ярко выраженной сезонности, а значит у вас всегда будут продажи;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
период обучение и адаптации - оплачиваемый. Мы готовы в вас вкладываться и растить специалиста-профи;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
у нас в компании работают действительно профессионалы в области недвижимости с многолетним опытом;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
вы точно прокачаете свои знания с нами и приобретёте бесценный опыт;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
нет потолка в заработной плате: чем больше вы работаете - тем больше вы зарабатываете;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
мы работаем прозрачно и честно, готовы предложить оформление по ТК РФ;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
мы активно развиваем корпоративную культуру: поздравляем со всеми праздниками наших сотрудников и устраиваем корпоративные встречи.
</li>
</ul>
<h5>Для нас важно, чтобы наш агент по недвижимости:</h5>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
ответственно и исполнительно выполнял задачи по достижению поставленных целей;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
был коммуникативным человеком;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
обладал коммерческим мышлением и был нацелен на заработок;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
знания в сфере психологии будут большим плюсом;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
не боялся влиться в новую для него сферу;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
но если каких-то знаний не хватает - мы готовы дать эту информацию и научить ею пользоваться.
</li>
</ul>
<h5>Какие у вас будут задачи:</h5>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
активный поиск клиентов и эффективная работа с имеющейся базой данных;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
профессиональная консультация и помощь клиентам в выборе недвижимости;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
организация и проведение просмотров объектов недвижимости;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
ведение переговоров и совершение сделок с покупателями и продавцами;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
управление документацией и соблюдение законодательства в области недвижимости.
</li>
</ul>
<h5>Условия работы и адаптации:</h5>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
уютный офис в центре города;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
работу в развивающейся, успешной компании с открытой культурой, где вы сможете реализовать свой экспертный опыт и вместе с нами достичь результатов;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
график работы — гибкий, можно совмещать с другой занятостью или учебой;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
заработная плата наших сотрудников на такой позиции в среднем 80.000-100.000 рублей в месяц;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
выплаты сразу;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
полноценное обучение от самых простых задач к более профессиональным;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
работа в молодой команде, средний возраст наших сотрудников - 30 лет;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
реальная возможность карьерного роста до руководителя отдела продаж.
</li>
</ul>
HTML
more_info_manager1 = <<-HTML
<p>Ваше резюме Вы можете прислать нам в личные сообщения сообщества или сразу позвонить по телефону и записать на собеседование.</p>
HTML

description_manager2 = <<-HTML
<p>РиелтСтройСфера приглашает амбициозного соискателя на должность "менеджер по недвижимости".</p>
<h5>Мы рады предложить следующие преимущества:</h5>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Выплата стипендий - наша компания готова оказать финансовую поддержку в форме стипендии для наших сотрудников. Это может стать дополнительным стимулом к твоему профессиональному росту и успехам;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Бесплатное, индивидуальное обучение - мы гарантируем, что каждый сотрудник получит индивидуальную программу обучения, которая будет адаптирована под его потребности. Мы предоставляем возможности для профессионального роста и развития;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Различные скидки в компании - работая у нас, ты сможешь воспользоваться различными скидками внутри компании. Это может быть как скидка на услуги риелторского агентства, так и на другие товары или услуги, предоставляемые нашей компанией или нашими партнерами;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Дружелюбный коллектив - у нас царит атмосфера взаимопонимания и дружелюбия. Мы уважаем и ценим каждого сотрудника и поощряем коллективную работу и поддержку. Ты сможешь почувствовать себя частью команды и получить поддержку своих коллег;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Домашняя атмосфера - в нашей компании созданы комфортные условия для работы. Мы стремимся, чтобы каждый сотрудник чувствовал себя как дома, комфортно и спокойно. Наша команда заботится о благополучии каждого сотрудника;
</li>
</ul>
HTML
more_info_manager2 = <<-HTML
<p>Если ты амбициозный и готов принять вызов, присоединяйся к нам в РиелтСтройСфера. Мы предлагаем тебе отличные возможности для развития и достижения успеха в сфере недвижимости!</p>
<p>Ваше резюме Вы можете прислать нам в личные сообщения сообщества или сразу позвонить по телефону и записать на собеседование.</p>
HTML

description_manager3 = <<-HTML
<p>Агентство недвижимости "РиелтСтройСфера"Мурманск открывает набор на вакансию "Агент по недвижимости"!</p>
<p>Мы входим в ТОП 5 агентств недвижимости Мурманска и оказываем весь спектр услуг в своей отрасли.</p>
<h5>Преимущества работы с нами:</h5>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Щедрые выплаты-стипендии, что позволит вам сосредоточиться на своем профессиональном росте без финансовых ограничений;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Весплатное и индивидуальное обучение, которое поможет вам развить все необходимые навыки для успешной карьеры в сфере недвижимости;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Выдача диплома государственного образца после обучения, которое полностью оплачивается нашим агентством. Мы готовы в вас вкладываться и растить специалиста-профессионала;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Наш коллектив отличается прекрасной и дружелюбной атмосферой, в которой вы будете себя комфортно чувствовать и получать поддержку от коллег;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Собственное рабочее место в офисе, который находиться в центре города;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
У наших услуг нет ярко выраженной сезонности, а значит у вас всегда будут продажи. Наша компания на рынке уже более 10 лет и имеет свою постоянную базу клиентов;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Удобный график работы, который позволит совмещать работу с учебой или другой занятостью;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Заработная плата наших сотрудников на такой позиции в среднем 80 000-100 000 рублей в месяц;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Мы работаем прозрачно и честно, готовы предложить оформление по ТК РФ.
</li>
</ul>
<h5>Какие у вас будут задачи:</h5>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
активный поиск клиентов и эффективная работа с имеющейся базой данных;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
профессиональная консультация и помощь клиентам в выборе недвижимости;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
организация и проведение просмотров объектов недвижимости;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
ведение переговоров и совершение сделок с покупателями и продавцами;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
управление документацией и соблюдение законодательства в области недвижимости.
</li>
</ul>
HTML
more_info_manager3 = <<-HTML
<p>Ваше резюме Вы можете прислать нам в личные сообщения сообщества или сразу позвонить по телефону и записать на собеседование.</p>
HTML

description_assistant = <<-HTML
<p>Агентство недвижимости «РиелтСтройСфера» ищет помощников риелтора. Наша организация специализируется на предоставлении профессиональных услуг по покупке, продаже и аренде недвижимости.</p>
<h5>Обязанности:</h5>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
проведение рыночного исследования по недвижимости;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
поиск потенциальных клиентов;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
организация и проведение просмотров недвижимости;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
подготовка необходимой документации;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
выполнение поручений наставника;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
рекламное продвижение объектов.
</li>
</ul>
<h5>Требования:</h5>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
опыт работы в сфере недвижимости приветствуется, но необязателен;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
коммуникативные и переговорные навыки будут вашим преимуществом;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
грамотное владение русским языком;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
ответственность, организованность.
</li>
</ul>
<h5>Мы предлагаем:</h5>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
оклад;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
премии + процент от сделок наставника;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
профессиональное обучение и развитие;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
постоянную поддержку и наставничество опытных специалистов;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
дружескую и открытую рабочую атмосферу;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
возможность реализовать свой потенциал и достичь успеха;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
карьерный рост.
</li>
</ul>
HTML
more_info_assistant = <<-HTML
<p>Возможно, совмещение с учебой. График работы и заработная плата обсуждается при собеседовании.</p>
<p>Мы буде рады приветствовать в нашей команде!</p>
HTML

description_realtor = <<-HTML
<p>Агентство недвижимости "РиелтСтройСфера" в Мурманске открывает набор на вакансию "Агент по недвижимости"!</p>
<p>Мы входим в ТОП 5 агентств недвижимости Мурманска и оказываем весь спектр услуг в своей отрасли.</p>
<h5>Преимущества работы с нами:</h5>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
щедрые выплаты-стипендии, что позволит вам сосредоточиться на своем профессиональном росте без финансовых ограничений;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
бесплатное и индивидуальное обучение, которое поможет вам развить все необходимые навыки для успешной карьеры в сфере недвижимости;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
выдача диплома государственного образца после обучения, которое полностью оплачивается нашим агентством. Мы готовы в вас вкладываться и растить специалиста-профессионала.
</li>
</ul>
<p>Наш коллектив отличается прекрасной и дружелюбной атмосферой, в которой вы будете себя комфортно чувствовать и получать поддержку от коллег.</p>
<p>Собственное рабочее место в офисе, который находиться в центре города.</p>
<p>У наших услуг нет ярко выраженной сезонности, а значит у вас всегда будут продажи. Наша компания на рынке уже более 10 лет и имеет свою постоянную базу клиентов.</p>
<p>Удобный график работы, который позволит совмещать работу с учебой или другой занятостью.</p>
<p>Заработная плата наших сотрудников на такой позиции в среднем 80.000-100.000 рублей в месяц.</p>
<h5>Какие у вас будут задачи:</h5>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
активный поиск клиентов и эффективная работа с имеющейся базой данных;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
профессиональная консультация и помощь клиентам в выборе недвижимости;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
организация и проведение просмотров объектов недвижимости;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
ведение переговоров и совершение сделок с покупателями и продавцами;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
управление документацией и соблюдение законодательства в области недвижимости.
</li>
</ul>
<h5>Мы предлагаем:</h5>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
оклад;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
премии + процент от сделок наставника;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
профессиональное обучение и развитие;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
постоянную поддержку и наставничество опытных специалистов;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
дружескую и открытую рабочую атмосферу;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
возможность реализовать свой потенциал и достичь успеха;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
карьерный рост.
</li>
</ul>
HTML
more_info_realtor = <<-HTML
<p>Ваше резюме Вы можете прислать нам в личные сообщения сообщества или сразу позвонить по телефону и записать на собеседование.</p>
HTML

description_specialist = <<-HTML
<p>Агентство недвижимости РиелтСтройСфера радо объявить о наборе на должность агента по недвижимости. Мы ищем профессионала, готового к новым вызовам и возможностям.</p>
<p>Отсутствие опыта работы является Вашим преимуществом!</p>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Обучение БЕСПЛАТНОЕ!
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Выплата стипендии!
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Гарантия результата!
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
По желанию официальное трудоустройство!
</li>
</ul>
<p>Как агент по недвижимости в нашем агентстве, вы будете заниматься широким спектром задач, связанных с поиском, предложением и продажей недвижимости. Ваша главная цель - помочь клиентам найти идеальную недвижимость, которая соответствует их потребностям и желаниям.</p>
<h5>Ваши обязанности будут включать, но не ограничиваться:</h5>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Активный поиск клиентов и эффективная работа с имеющейся базой данных;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Профессиональная консультация и помощь клиентам в выборе недвижимости;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Организация и проведение просмотров объектов недвижимости;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Ведение переговоров и совершение сделок с покупателями и продавцами;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
Управление документацией и соблюдение законодательства в области недвижимости.
</li>
</ul>
<p>Мы ищем кандидата с высоким уровнем энергии, отличными коммуникативными навыками и способностью эффективно работать в команде. Вы должны быть твердо уверены в своих навыках продаж и быть готовыми работать в динамичной и конкурентной среде недвижимости. Опыт работы в сфере недвижимости будет существенным преимуществом, но не является обязательным.</p>
<p>Наши сотрудники получают конкурентоспособную зарплату, комиссионные и возможность для профессионального роста. Мы предлагаем вам присоединиться к нашей команде, где вы сможете проявить свой потенциал, развить навыки и достичь успеха.</p>
<p>Если вы готовы принять вызов и стать частью нашей успешной команды, пришлите нам ваше резюме с указанием вакансии "агент по недвижимости". Мы рассмотрим все заявки и свяжемся с вами для дальнейшего собеседования.</p>
HTML
more_info_specialist = <<-HTML
<p>Присоединяйтесь к Агентству недвижимости РиелтСтройСфера и станьте частью нашего профессионального сообщества!</p>
HTML

description_intern = <<-HTML
<p>Агентство недвижимости «РиелтСтройСфера» ищет помощников риелтора. Наша организация специализируется на предоставлении профессиональных услуг по покупке, продаже и аренде недвижимости.</p>
<h5>Обязанности:</h5>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
проведение рыночного исследования по недвижимости;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
поиск потенциальных клиентов;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
организация и проведение просмотров недвижимости;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
подготовка необходимой документации;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
выполнение поручений наставника;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
рекламное продвижение объектов.
</li>
</ul>
<h5>Требования:</h5>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
опыт работы в сфере недвижимости приветствуется, но необязателен;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
коммуникативные и переговорные навыки будут вашим преимуществом;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
грамотное владение русским языком;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
ответственность, организованность.
</li>
</ul>
<h5>Мы предлагаем:</h5>
<ul class="list-none">
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
оклад;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
премии + процент от сделок наставника;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
профессиональное обучение и развитие;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
постоянную поддержку и наставничество опытных специалистов;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
дружескую и открытую рабочую атмосферу;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
возможность реализовать свой потенциал и достичь успеха;
</li>
<li class="items-center mb-2">
<i class="bi bi-arrow-right-short"></i>
карьерный рост.
</li>
</ul>
HTML
more_info_intern = <<-HTML
<p>Возможно, совмещение с учебой. График работы и заработная плата обсуждается при собеседовании.</p>
<p>Мы буде рады приветствовать в нашей команде!</p>
HTML

vacancies = [
  {
    name: "Агент по недвижимости", status: true, location: location, experience: "Без опыта",
    income_from: "80000", income_to: "110000", income_type: "на руки",
    published_at: published_at,
    description: description_agent,
    more_info: more_info_agent
  },
  {
    name: "Агент по недвижимости", status: true, location: location, experience: "Без опыта",
    income_from: "100000", income_to: "120000", income_type: "на руки",
    published_at: published_at,
    description: description_agent2,
    more_info: more_info_agent2
  },
  {
    name: "Агент по продаже недвижимости", status: true, location: location, experience: "Без опыта",
    income_from: "120000", income_to: "", income_type: "на руки",
    published_at: published_at,
    description: description_agent3,
    more_info: more_info_agent3
  },
  {
    name: "Менеджер по аренде недвижимости", status: true, location: location, experience: "Без опыта",
    income_from: "60000", income_to: "100000", income_type: "на руки",
    published_at: published_at,
    description: description_manager1,
    more_info: more_info_manager1
  },
  {
    name: "Менеджер по недвижимости", status: true, location: location, experience: "Без опыта",
    income_from: "100000", income_to: "", income_type: "на руки",
    published_at: published_at,
    description: description_manager2,
    more_info: more_info_manager2
  },
  {
    name: "Менеджер по продаже недвижимости", status: true, location: location, experience: "Без опыта",
    income_from: "60000", income_to: "", income_type: "до вычета налогов",
    published_at: published_at,
    description: description_manager3,
    more_info: more_info_manager3
  },
  {
    name: "Помощник риелтора", status: true, location: location, experience: "Без опыта",
    income_from: "40000", income_to: "80000", income_type: "на руки",
    published_at: published_at,
    description: description_assistant,
    more_info: more_info_assistant
  },
  {
    name: "Риелтор", status: true, location: location, experience: "1–3 года",
    income_from: "80 000", income_to: "", income_type: "до вычета налогов",
    published_at: published_at,
    description: description_realtor,
    more_info: more_info_realtor
  },
  {
    name: "Специалист по работе с недвижимостью", status: true, location: location, experience: "Без опыта",
    income_from: "100000", income_to: "120000", income_type: "на руки",
    published_at: published_at,
    description: description_specialist,
    more_info: more_info_specialist
  },
  {
    name: "Стажёр по недвижимости", status: true, location: location, experience: "Без опыта",
    income_from: "40000", income_to: "80000", income_type: "на руки",
    published_at: published_at,
    description: description_intern,
    more_info: more_info_intern
  }
]

more_data = {
  "Агент по недвижимости1" => {
    employment_types: "Полная занятость, полный день | Возможна подработка: сменами по 4-6 часов или по вечерам",
    skills: "Деловая коммуникация | Навыки переговоров | Заключение договоров | Активные продажи | Деловая этика"
  },
  "Агент по недвижимости2" => {
    employment_types: "Полная занятость, полный день",
    skills: "Деловая коммуникация | Навыки переговоров | Заключение договоров | Активные продажи | Деловая этика"
  },
  "Агент по продаже недвижимости3" => {
    employment_types: "Полная занятость, полный день",
    skills: "Деловая коммуникация | Навыки переговоров | Заключение договоров | Активные продажи | Деловая этика"
  },
  "Менеджер по аренде недвижимости4" => {
    employment_types: "Частичная занятость, полный день | Возможна подработка: сменами по 4-6 часов или по вечерам",
    skills: "Коммуникабельность | Агентские продажи | Недвижимость"
  },
  "Менеджер по недвижимости5" => {
    employment_types: "Полная занятость, полный день | Возможна подработка: сменами по 4-6 часов",
    skills: "Обучение и развитие"
  },
  "Менеджер по продаже недвижимости6" => {
    employment_types: "Полная занятость, полный день",
    skills: "Активные продажи | Коммуникабельность"
  },
  "Помощник риелтора7" => {
    employment_types: "Частичная занятость, полный день | Возможна подработка: сменами по 4-6 часов или по вечерам",
    skills: "Без опыта | Начало карьеры | Коммуникабельность | Обучение и развитие | Деловое общение | Поиск и привлечение клиентов | Недвижимость | Агентские продажи"
  },
  "Риелтор8" => { employment_types: "Полная занятость, полный день", skills: "Коммуникабельность" },
  "Специалист по работе с недвижимостью9" => {
    employment_types: "Полная занятость, полный день",
    skills: "Деловая коммуникация | Обучение и развитие | Навыки переговоров | Коммерческая недвижимость | Деловое общение | Активные продажи | Работа с большим объемом информации | Деловая этика"
  },
  "Стажёр по недвижимости10" => {
    employment_types: "Стажировка, полный день | Возможна подработка: сменами по 4-6 часов или по вечерам",
    skills: "Без опыта | Начало карьеры | Коммуникабельность | Обучение и развитие | Деловое общение | Поиск и привлечение клиентов | Недвижимость | Агентские продажи"
  }
}

vacancies.each.with_index(1) do |vacancy_data, index|
  vacancy = Vacancy.find_or_create_by(vacancy_data)

  vacancy.job_title_id = JobTitle.find_by(name: vacancy.name).id
  vacancy.team_member_id = TeamMember.joins(:job_titles).where(job_titles: { name: "HR Менеджер" }).take.id

  data_item = more_data["#{vacancy.name}#{index}"]

  employment_type_ids = EmploymentType.where(name: data_item[:employment_types].split(" | ")).pluck(:id)
  skill_ids = Skill.where(name: data_item[:skills].split(" | ")).pluck(:id)

  vacancy.employment_type_ids = employment_type_ids
  vacancy.skill_ids = skill_ids
  vacancy.save

  puts "Вакансия создана: #{vacancy.name}"
end

puts "Seeding Vacancies completed!\r\n\r\n"
# Vacancies End
