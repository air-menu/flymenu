abstract class IRepository<T> {

  Future<void> insert(T item);

  Future<void> delete(T item);

  Future<void> update(T item);

  Future<List<T>> getAll();

  Future<T?> getByID(String id);
}