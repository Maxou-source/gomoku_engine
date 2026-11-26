 #===============================================================================#
#								PROJECT INFOS									  #
 #===============================================================================#

NAME				=	gomoku

 #=================================================#
#					COMPILATION						#
 #=================================================#

CC					=	clang++
CC_C				=   clang

FLAGS				=	$(DBFLAGS) $(CFLAGS) $(INCLUDES_FLAGED) $(CDFLAGS)

PKG_CONFIG = pkg-config
CFLAGS				=	-gdwarf-4  $(shell $(PKG_CONFIG) --cflags xcb) -fenable-matrix -Wall -Werror -Wextra

DBFLAGS				=	-g3

CDFLAGS				=	-MMD -MP

INCLUDEFLAG			=	-I

INCLUDES_FLAGED		=	$(addprefix $(INCLUDEFLAG), $(INCLUDES))

 #=================================================#
#					DIRECTORIES						#
 #=================================================#

SRC_DIR				=	src/
OBJECTS_DIR			=	Object/

CLASSES_DIR			=	Classes/
INCLUDE_DIR			=	includes/

 #===============================================================================#
#								SOURCES											  #
 #===============================================================================#

INCLUDES			=	$(INCLUDE_DIR) \
							$(addprefix $(INCLUDE_DIR), \
							$(CLASSES_DIR) \
							)

CLASSES_SRC			=	$(addprefix $(CLASSES_DIR), \
						Board.cpp \
						Tile.cpp \
						)

SRC_FILES_CPP			=	$(addprefix $(SRC_DIR), \
						main.cpp \
						$(CLASSES_SRC) \
						)



 #=============================================================================#
#									OBJETS										#
 #=============================================================================#

OBJS_DIR	=	.objects/

OBJS_CPP	=	$(subst $(SRC_DIR), $(OBJS_DIR), $(SRC_FILES_CPP:%.cpp=%.o))
OBJS_C		=	$(subst $(SRC_DIR), $(OBJS_DIR), $(SRC_FILES_C:%.c=%.o))

OBJS		=	$(OBJS_CPP) $(OBJS_C)

DEPS		=	$(OBJS:%.o=%.d)

 #=============================================================================#
#									RULES										#
 #=============================================================================#

$(OBJS_DIR)%.o : $(SRC_DIR)%.cpp
				mkdir -p $(dir $@)
				$(CC) $(FLAGS) -c $< -o $@

$(OBJS_DIR)%.o : $(SRC_DIR)%.c
				mkdir -p $(dir $@)
				$(CC_C) $(FLAGS) -c $< -o $@

all : $(NAME)

$(NAME)		:	$(OBJS_DIR) $(OBJS) Makefile
				$(CC) $(FLAGS) $(OBJS) -o $(NAME)

$(OBJS_DIR) :
				mkdir $(OBJS_DIR)

clean		:
				rm -rf $(OBJS_DIR)

fclean		:	clean
				rm -rf $(NAME)

re			:	fclean all

-include $(DEPS)

.PHONY: all clean fclean re
