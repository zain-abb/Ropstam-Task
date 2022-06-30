import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:ropstam_task/features/home/usecases/get_posts_usecase.dart';
import 'package:ropstam_task/services/usecase/usecase.dart';

import '../../../../services/error/failure.dart';
import '../../models/post_response_model.dart';

class HomeViewModel extends ChangeNotifier {
  GetPostsUsecase getPostsUsecase;

  HomeViewModel(this.getPostsUsecase);

  ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);

  ValueChanged<String>? onErrorMessage;

  List<PostResponseModel> posts = [];

  void handleError(Either<Failure, dynamic> either) {
    isLoadingNotifier.value = false;
    either.fold((l) => onErrorMessage?.call(l.message), (r) => null);
  }

  Future<void> getPosts() async {
    posts = [];
    isLoadingNotifier.value = true;
    var postsEither = await getPostsUsecase.call(NoParams());

    if (postsEither.isLeft()) {
      handleError(postsEither);
      isLoadingNotifier.value = false;
    } else {
      postsEither.foldRight(null, (r, previous) async {
        posts = r;
      });
      isLoadingNotifier.value = false;
    }
  }
}
