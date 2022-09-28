<?php class ArticleController extends DatabaseController
{
    public function affectDataToRow(&$row, $sub_rows)
    { // Cette méthode permet d’ajouter les propriétés appuser, theme, image, comment, tag dans l’objet article.

        // AppUser 
        if (isset($sub_rows['appuser'])) { 
            $appusers = array_values(array_filter($sub_rows['appuser'], function ($item) use ($row) {
                return $item->Id_appUser == $row->Id_appUser;
            }));
            if (isset($appusers)) { // Récupère un seul objet (getMany)
                $row->appuser = count($appusers) == 1 ? array_shift($appusers) : null;
            }
        }

        // Themes
        if (isset($sub_rows['theme'])) {
            $themes = array_values(array_filter($sub_rows['theme'], function ($item) use ($row) {
                return $item->Id_theme == $row->Id_theme;
            }));
            if (isset($themes)) { // Récupère un seul objet (getMany)
                $row->theme = count($themes) == 1 ? array_shift($themes) : null;
            }
        }

        // Images
        if (isset($sub_rows['image'])) {
            $images = array_values(array_filter($sub_rows['image'], function ($item) use ($row) {
                return $item->Id_article == $row->Id_article;
            }));
            if (isset($images)) { // Récupère plusieurs objets (getAll)
                $row->image = $images;
            }
        }

        // Comment
        if (isset($sub_rows['comment'])) {
            $comments = array_values(array_filter($sub_rows['comment'], function ($item) use ($row) {
                return $item->Id_article == $row->Id_article;
            }));
            if (isset($comments)) { // Récupère plusieurs objets (getAll)
                $row->comments_list = $comments;
            }
        }

        // Tag
        if (isset($sub_rows['tag'])) {
            $tags = array_values(array_filter($sub_rows['tag'], function ($item) use ($row) {
                return $item->Id_article == $row->Id_article;
            }));
            if (isset($tags)) {  // Récupère plusieurs objets du tableau tag (getAll)
                $row->tags_list = array_column($tags, 'tag');
            }
        }
    }
}
