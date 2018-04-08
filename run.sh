CDR_IE_ROOT=`pwd`
PROTO_DIR=${CDR_IE_ROOT}/data/cdr/processed/just_train_2500/protos

CUDA_VISIBLE_DEVICES=0 python ${CDR_IE_ROOT}/src/train_multiclass_classifier.py \
  --vocab_dir=${PROTO_DIR} \
  --optimizer=adam \
  --loss_type= \
  --model_type=classifier \
  --lr=.0005 \
  --margin=1.0 \
  --l2_weight=0 \
  --word_dropout=.5 \
  --lstm_dropout=.95 \
  --final_dropout=.35 \
  --clip_norm=10 \
  --text_weight=1.0 \
  --text_prob=1.0 \
  --token_dim=64 \
  --lstm_dim=64 \
  --embed_dim=64 \
  --kb_epochs=100000 \
  --text_epochs=1 \
  --eval_every=15000 \
  --max_seq=2000 \
  --neg_samples=200 \
  --random_seed=1111 \
  --in_memory \
  --bidirectional \
  --train_dev_percent .85 \
  --doc_filter ${CDR_IE_ROOT}/data/cdr/CDR_pubmed_ids/CDR_Train_Dev_pubmed_ids.txt \
  --noise_std 0.1 \
  --block_repeats 2 \
  --embeddings ${CDR_IE_ROOT}/data/embeddings/just_train_2500_64d \
  --ner_prob 0.5 \
  --ner_weight 10.0 \
  --ner_test ${PROTO_DIR}/ner_CDR_dev.txt.proto \
  --ner_train ${PROTO_DIR}/ner_CDR_train.txt.proto \
  --dropout_loss_weight 0 \
  --word_unk_dropout 0.85 \
  --beta1 .1 \
  --beta2 .9 \
  --kb_pretrain 0 \
  --ner_batch 16 \
  --text_batch 32 \
  --kb_batch 16 \
  --num_classes 2 \
  --kb_vocab_size 2 \
  --text_encoder transformer_cnn_all_pairs \
  --position_dim 0 \
  --epsilon=1e-4 \
  --neg_noise=.20 \
  --pos_noise=.33 \
  --negative_test_test=${PROTO_DIR}/negative_*test_filtered.txt.proto \
  --positive_test_test=${PROTO_DIR}/positive_*test.txt.proto \
  --negative_test=${PROTO_DIR}/negative_*train*_filtered.txt.proto \
  --positive_test=${PROTO_DIR}/positive_*train*.txt.proto \
  --negative_train=${PROTO_DIR}/negative_*train*_filtered.txt.proto \
  --positive_train=${PROTO_DIR}/positive_*train*.txt.proto \
  --logdir=${CDR_IE_ROOT}/saved_models/cdr/relex/cdr_2500/2018-04-07-21//13424_21185