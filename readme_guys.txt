Какие файлы поменял:
    шаблоны:
        app/views/layouts/_navbar.html.erb
        app/views/layouts/application.html.erb
        app/views/sessions/new.html.erb
        app/views/users/new.html.erb
        app/views/articles/index.html.erb
        app/views/comments/_form.html.erb
        app/assets/config/manifest.js
        app/assets/stylesheets/application.css
        config/initializers/assets.rb
    эндпоиты:
        config/routes.rb # у вас тут какая-то каша прям была, переделал
    контроллеры:
        app/controllers/sessions_controller.rb # Изначально, например, log out не работал (но, возможно, это я его сломал:))), как раз из-за каши в routes, починил. Код чутка улучшил
        app/controllers/user_controller.rb # добавил профиль пользователя, немного ваш код улучшил
        app/controllers/comments_controller.rb
        app/controllers/articles_controller.rb
        app/controllers/application_controller.rb
    модели:
        app/models/user.rb # валидацию улучшил
        app/models/comment.rb

Какие файлы добавил:
app/assets/stylesheets/main.css - весь сss в одном файле, ваш файл css'a не трогал
app/views/users/show.html.erb
app/views/users/edit.html.erb
app/assets/javascripts/application.js # создайте папку javascripts
app/helpers/pagination_helper.rb
Gemfile
config/initializers/pagy.rb

Какие файлы удалил:
app/views/sessions/create и destroy.html.erb, views/users/create # они просто не нужны
app/views/articles/my_articles.html.erb


Добавил новую миграцию, которая добавляет поле user_id таблице comments

Возможно где-то еще что-то менял, но забыл дописать