import 'dart:html';

late InputElement toDoInput;
late UListElement toDoList;
late InputElement next;
late SpanElement errors;
void main() {
  toDoInput = querySelector('#to-do-input') as InputElement;

  toDoList = querySelector('#to-do-list') as UListElement;

  next = querySelector('#next') as InputElement;

  errors = querySelector('#error-message') as SpanElement;

  // toDoInput.onChange.listen(addToDoItem);

  next.onClick.listen((Event event) {
    // event.preventDefault();
    addToDoItem(event);
  });
  toDoInput.onKeyDown.listen((Event event) {
    errors.text = '';
    toDoInput.style.border = '2px solid silver';
  });
}

void addToDoItem(Event e) {
  var newToDo = LIElement();

  if (toDoInput.value != '') {
    newToDo.text = toDoInput.value;
    toDoInput.value = '';
    toDoList.children.add(newToDo);
  } else {
    toDoInput.style.border = '2px solid red';
    errors.removeAttribute('hidden');
    errors.text = 'Cannot accept empty strings';
    errors.style.color = 'red';
  }
}
