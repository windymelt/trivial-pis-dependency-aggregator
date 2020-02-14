# trivial-pis-dependency-aggregator
A complementary function for package-inferred-system

## Synopsis

このパッケージを使うことによって、特定のディレクトリに対して自動的にpackage-inferred-system上の依存関係を生やすことができます。

package-inferred-systemにおいては、コンパイルするためのファイル同士の依存関係はパッケージ定義上の`:use`や`:import-from`によって自動的に定義されました。

しかしながら特定の場合には、コンパイルする必要があるにもかかわらず、直接的な`:use`や`:import-from`が生じない場合もあります。
典型的なパターンとして、Webアプリケーションのルーティング定義を`example/`以下に示しています。
この例では、各ファイルがHTTPのパスに対応するコントローラを定義しています。
ファイル同士の依存関係は一方的で、各コントローラはコントローラを定義するためのマクロに依存していますが、他のどのパッケージからも依存されていません。
package-inferred-systemでは、このような他のどのパッケージからも依存されていないパッケージはコンパイルされません。

`trivial-pis-dependency-aggregator`は、指定したディレクトリ以下のパッケージ全てに依存する上位パッケージを生成します。このパッケージに依存しておけば、自動的にそのディレクトリ以下の全てのパッケージがコンパイルされます。
