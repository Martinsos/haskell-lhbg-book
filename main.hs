main = putStrLn myhtml

myhtml = makeHtml "My page title" (h1_ "Title!" <> p_ "My page content")

makeHtml :: String -> String -> String
makeHtml title body = html_ $ head_ (title_ title) <> body_ body

type ElementCon = String -> String

newtype Html = Html String

newtype Structure = Structure String

html_ :: ElementCon
html_ = el "html"

body_ :: ElementCon
body_ = el "body"

head_ :: ElementCon
head_ = el "head"

title_ :: ElementCon
title_ = el "title"

p_ :: ElementCon
p_ = el "p"

h1_ :: ElementCon
h1_ = el "h1"

el :: String -> ElementCon
el tag x = "<" <> tag <> ">" <> x <> "</" <> tag <> ">"
